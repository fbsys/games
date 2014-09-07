class Avatar < ActiveRecord::Base
  has_many :time_management_sheets, :dependent => :destroy
  serialize :dates

  def self.make(file_path)
    options = {:mode => "r"}
    file = Roo::Spreadsheet.open(file_path, options)
    
    #todo: these codes regist to databases by models.
    col_sten = 1 #start/end
    col_depa = 3 #department code
    col_inst = 4 #instruction code
    col_team = 5 #team code
    col_task = 6 #task code
    col_proc = 8 #process code
    col_mpow = 9 #mon power
    col_head = 6 #header data
    row_ym = 3 #year and month
    row_group = 4 #group
    row_team = 5 #team
    row_comp = 6 #copmany
    row_enum = 7 #employee number
    row_name = 8 #name
    
    s_names = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
    avatar_types = {:strength => "warrior", :constitution => "knight", :intelligence => "scholar", :magic => "sorcerer", :agility => "hunter", :charm => "star"}
    
    s_names = file.sheets & s_names
    s_idxs = s_names.collect{|item| file.sheets.index(item) + 1}
    
    #group = ""
    #team = ""
    comp = ""
    enumb = ""
    ename = ""
    
    dates = []
    sh_idxs = []
    start_rows = {}
    end_rows = {}
    dates_h = {}
    
    s_idxs.each do |s_idx|
      #get start and end
      rows = file.first_row(s_idx).upto(file.last_row(s_idx))
      start_row = rows.detect do |r|
        file.cell(r, col_sten, s_idx).to_s == "START"
      end
      rows = start_row.upto(file.last_row(s_idx))
      end_row = rows.detect do |r|
        file.cell(r, col_sten, s_idx).to_s == "END"
      end
      next unless start_row && end_row
      
      ym = file.cell(row_ym, col_head, s_idx)
      #group = file.cell(row_group, col_head, s_idx).to_s
      #team = file.cell(row_team, col_head, s_idx).to_s
      comp_t = file.cell(row_comp, col_head, s_idx).to_s
      enumb_t = file.cell(row_enum, col_head, s_idx).to_s
      ename_t = file.cell(row_name, col_head, s_idx).to_s
      next unless !ym.to_s.empty? && !comp_t.empty? && !enumb_t.empty? && !ym.to_s.to_i.zero?
      comp = comp_t if comp.empty?
      enumb = enumb_t if enumb.empty?
      ename = ename_t if ename.empty?
      next unless (comp == comp_t) && (enumb == enumb_t) && (ename == ename_t)
      dates << ym
      sh_idxs << s_idx
      dates_h[s_idx] = ym
      start_rows[s_idx] = start_row
      end_rows[s_idx] = end_row
    end
    return false if dates.empty?
    
    avatar = Avatar.where(["employee_num = ? and company_name = ?", enumb, comp]).all.find{|i| i.dates == dates}
    unless avatar
      avatar = Avatar.new(:avatar_type => avatar_types[:charm])
      avatar.save
    end
    #TimeManagementSheet.where(["year = ? and month = ? and employee_num = ? and company_name = ?", ym.year, ym.month, enumb, comp]).destroy_all
    TimeManagementSheet.where(["avatar_id = ?", avatar.id]).destroy_all
    
    sh_idxs.each do |s_idx|
      ym = dates_h[s_idx]
      rows = start_rows[s_idx].upto(end_rows[s_idx])
      
      rows.each do |r|
        if file.cell(r, col_mpow, s_idx) && file.cell(r, col_mpow, s_idx) > 0
          tms = TimeManagementSheet.new(year: ym.year, month: ym.month, employee_num: enumb, company_name: comp, department_code: file.cell(r, col_depa, s_idx).to_i.to_s, team_code: file.cell(r, col_team, s_idx).to_s, man_hour: file.cell(r, col_mpow, s_idx).to_f, task_code:file.cell(r, col_task, s_idx).to_s)
          inst_code = file.cell(r, col_inst, s_idx)
          inst = Instruction.where(["instruction_code = ?", format("%07d", inst_code.to_i)]).first
          unless inst
            inst = Instruction.new(instruction_code: inst_code, status_type: "potential")
            inst.save
          end
          tms.instruction = inst
          tsk_code = tms.task_code.to_s[0,3]
          tsk = WorkTask.where(["short_task_code = ?", tsk_code]).first
          unless tsk
            tsk = WorkTask.new(short_task_code: tsk_code, status_type: "potential")
            tsk.save
          end
          tms.work_task = tsk
          proc_code = file.cell(r, col_proc, s_idx).to_s
          proc = WorkProcess.where(["process_code = ?", proc_code[0, 3]]).first
          unless proc
            proc = WorkProcess.new(process_code: proc_code[0, 3], status_type: "potential", name: proc_code[4, proc_code.length - 4])
            proc.save
          end
          tms.work_process = proc
          tms.avatar = avatar
          tms.save
        end
      end
    end
    
    
    ##parametarization
    tmses = TimeManagementSheet.where(["avatar_id = ?", avatar.id])
    
    #instruction
    coefficient = 0.05
    strength = tmses.joins(:instruction).where(["status_type = ?", "strength"]).sum(:man_hour) * coefficient
    constitution = tmses.joins(:instruction).where(["status_type = ?", "constitution"]).sum(:man_hour) * coefficient
    intelligence = tmses.joins(:instruction).where(["status_type = ?", "intelligence"]).sum(:man_hour) * coefficient
    magic = tmses.joins(:instruction).where(["status_type = ?", "magic"]).sum(:man_hour) * coefficient
    agility = tmses.joins(:instruction).where(["status_type = ?", "agility"]).sum(:man_hour) * coefficient
    charm = tmses.joins(:instruction).where(["status_type = ?", "charm"]).sum(:man_hour) * coefficient
    luck = tmses.joins(:instruction).where(["status_type = ?", "luck"]).sum(:man_hour) * coefficient
    potential = tmses.joins(:instruction).where(["status_type = ?", "potential"]).sum(:man_hour) * coefficient
    
    #work_task
    coefficient = 0.15
    strength = strength + tmses.joins(:work_task).where(["status_type = ?", "strength"]).sum(:man_hour) * coefficient
    constitution = constitution + tmses.joins(:work_task).where(["status_type = ?", "constitution"]).sum(:man_hour) * coefficient
    intelligence = intelligence + tmses.joins(:work_task).where(["status_type = ?", "intelligence"]).sum(:man_hour) * coefficient
    magic = magic + tmses.joins(:work_task).where(["status_type = ?", "magic"]).sum(:man_hour) * coefficient
    agility = agility + tmses.joins(:work_task).where(["status_type = ?", "agility"]).sum(:man_hour) * coefficient
    charm = charm + tmses.joins(:work_task).where(["status_type = ?", "charm"]).sum(:man_hour) * coefficient
    luck = luck + tmses.joins(:work_task).where(["status_type = ?", "luck"]).sum(:man_hour) * coefficient
    potential = potential + tmses.joins(:work_task).where(["status_type = ?", "potential"]).sum(:man_hour) * coefficient
    
    #work_process
    coefficient = 0.80
    strength = strength + tmses.joins(:work_process).where(["status_type = ?", "strength"]).sum(:man_hour) * coefficient
    constitution = constitution + tmses.joins(:work_process).where(["status_type = ?", "constitution"]).sum(:man_hour) * coefficient
    intelligence = intelligence + tmses.joins(:work_process).where(["status_type = ?", "intelligence"]).sum(:man_hour) * coefficient
    magic = magic + tmses.joins(:work_process).where(["status_type = ?", "magic"]).sum(:man_hour) * coefficient
    agility = agility + tmses.joins(:work_process).where(["status_type = ?", "agility"]).sum(:man_hour) * coefficient
    charm = charm + tmses.joins(:work_process).where(["status_type = ?", "charm"]).sum(:man_hour) * coefficient
    luck = luck + tmses.joins(:work_process).where(["status_type = ?", "luck"]).sum(:man_hour) * coefficient
    potential = potential + tmses.joins(:work_process).where(["status_type = ?", "potential"]).sum(:man_hour) * coefficient
    
    #luck
    luck = (luck + rand(strength) + 1 + rand(constitution) + 1 + rand(intelligence) + 1 + rand(magic) + 1 + rand(agility) + 1 + rand(charm) + 1 + rand(potential) + 1).to_i
    
    #to_i
    strength = strength.to_i
    constitution = constitution.to_i
    intelligence = intelligence.to_i
    magic = magic.to_i
    agility = agility.to_i
    charm = charm.to_i
    luck = luck.to_i
    potential = potential.to_i
    
    #avatar_type = {strength => "warrior", constitution => "knight", intelligence => "scholar", magic => "sorcerer", agility => "hunter", charm => "star", luck => "lucky", potential => "brave"}.max[1]
    #avatar_type = {strength => "warrior", constitution => "knight", intelligence => "scholar", magic => "sorcerer", agility => "hunter", charm => "star", potential => "brave"}.max[1]
    avatar_type = {strength => "warrior", constitution => "knight", intelligence => "scholar", magic => "sorcerer", agility => "hunter", charm => "star"}.max[1]
    
    #Avatar.where(["employee_num = ? and company_name = ?", enumb, comp]).all.each{|item| item.destroy if item.dates == dates}
    if !avatar_type.empty? && !dates.empty?
      avatar.update_attributes({:employee_num => enumb, :employee_name => ename, :company_name => comp, :avatar_type => avatar_type, :strength => strength, :constitution => constitution, :intelligence => intelligence, :magic => magic, :agility => agility, :charm => charm, :luck => luck, :potential => potential})
      avatar.dates = dates
      return avatar
    else
      avatar.destroy
      #TimeManagementSheet.where(["avatar_id = ?", avatar.id]).destroy_all
      return false
    end
    #return Avatar.new(year: ym.year, month: ym.month, employee_num: enumb, company_name: comp, strength: strength, constitution: constitution, intelligence: intelligence, magic: magic, agility: agility, charm: charm, luck: luck, potential: potential)
  end

end
