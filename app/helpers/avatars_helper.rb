module AvatarsHelper
  def pie_instruction(avatar)
    tmses = avatar.time_management_sheets
    #coefficient = 0.05
    coefficient = 1.0
    strength = tmses.joins(:instruction).where(["status_type = ?", "strength"]).group("instruction_code").sum(:man_hour)
    constitution = tmses.joins(:instruction).where(["status_type = ?", "constitution"]).group("instruction_code").sum(:man_hour)
    intelligence = tmses.joins(:instruction).where(["status_type = ?", "intelligence"]).group("instruction_code").sum(:man_hour)
    magic = tmses.joins(:instruction).where(["status_type = ?", "magic"]).group("instruction_code").sum(:man_hour)
    agility = tmses.joins(:instruction).where(["status_type = ?", "agility"]).group("instruction_code").sum(:man_hour)
    charm = tmses.joins(:instruction).where(["status_type = ?", "charm"]).group("instruction_code").sum(:man_hour)
    luck = tmses.joins(:instruction).where(["status_type = ?", "luck"]).group("instruction_code").sum(:man_hour)
    potential = tmses.joins(:instruction).where(["status_type = ?", "potential"]).group("instruction_code").sum(:man_hour)
    
    graphdata = "[" + 
        strength.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#ff7f7f', highlight: '#ffadad', label: 'str_#{key}' }, "}.join + 
        constitution.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#ff7fff', highlight: '#ffadff', label: 'con_#{key}' }, "}.join + 
        intelligence.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7f7fff', highlight: '#adadff', label: 'int_#{key}' }, "}.join + 
        magic.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7fffff', highlight: '#adffff', label: 'mag_#{key}' }, "}.join + 
        agility.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7fffbf', highlight: '#adffd6', label: 'agi_#{key}' }, "}.join + 
        charm.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7fff7f', highlight: '#adffad', label: 'cha_#{key}' }, "}.join + 
        potential.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#ffbf7f', highlight: '#ffd6ad', label: 'pot_#{key}' }, "}.join.sub(/, \Z/, '') + 
        "]"
    return graphdata
  end
  
  def pie_task(avatar)
    tmses = avatar.time_management_sheets
    
    #coefficient = 0.15
    coefficient = 1.0
    strength = tmses.joins(:work_task).where(["status_type = ?", "strength"]).group("task_code").sum(:man_hour)
    constitution = tmses.joins(:work_task).where(["status_type = ?", "constitution"]).group("task_code").sum(:man_hour)
    intelligence = tmses.joins(:work_task).where(["status_type = ?", "intelligence"]).group("task_code").sum(:man_hour)
    magic = tmses.joins(:work_task).where(["status_type = ?", "magic"]).group("task_code").sum(:man_hour)
    agility = tmses.joins(:work_task).where(["status_type = ?", "agility"]).group("task_code").sum(:man_hour)
    charm = tmses.joins(:work_task).where(["status_type = ?", "charm"]).group("task_code").sum(:man_hour)
    luck = tmses.joins(:work_task).where(["status_type = ?", "luck"]).group("task_code").sum(:man_hour)
    potential = tmses.joins(:work_task).where(["status_type = ?", "potential"]).group("task_code").sum(:man_hour)
    
    graphdata = "[" + 
        strength.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#ff7f7f', highlight: '#ffadad', label: 'str_#{key}' }, "}.join + 
        constitution.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#ff7fff', highlight: '#ffadff', label: 'con_#{key}' }, "}.join + 
        intelligence.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7f7fff', highlight: '#adadff', label: 'int_#{key}' }, "}.join + 
        magic.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7fffff', highlight: '#adffff', label: 'mag_#{key}' }, "}.join + 
        agility.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7fffbf', highlight: '#adffd6', label: 'agi_#{key}' }, "}.join + 
        charm.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7fff7f', highlight: '#adffad', label: 'cha_#{key}' }, "}.join + 
        potential.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#ffbf7f', highlight: '#ffd6ad', label: 'pot_#{key}' }, "}.join.sub(/, \Z/, '') + 
        "]"
    return graphdata
  end
  
  def pie_process(avatar)
    tmses = avatar.time_management_sheets
    
    #coefficient = 0.80
    coefficient = 1.0
    strength = tmses.joins(:work_process).where(["status_type = ?", "strength"]).group("process_code").sum(:man_hour)
    constitution = tmses.joins(:work_process).where(["status_type = ?", "constitution"]).group("process_code").sum(:man_hour)
    intelligence = tmses.joins(:work_process).where(["status_type = ?", "intelligence"]).group("process_code").sum(:man_hour)
    magic = tmses.joins(:work_process).where(["status_type = ?", "magic"]).group("process_code").sum(:man_hour)
    agility = tmses.joins(:work_process).where(["status_type = ?", "agility"]).group("process_code").sum(:man_hour)
    charm = tmses.joins(:work_process).where(["status_type = ?", "charm"]).group("process_code").sum(:man_hour)
    luck = tmses.joins(:work_process).where(["status_type = ?", "luck"]).group("process_code").sum(:man_hour)
    potential = tmses.joins(:work_process).where(["status_type = ?", "potential"]).group("process_code").sum(:man_hour)
    
    graphdata = "[" + 
        strength.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#ff7f7f', highlight: '#ffadad', label: 'str_#{key}-#{WorkProcess.where(:process_code => key).first.name[0,3]}...' }, "}.join + 
        constitution.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#ff7fff', highlight: '#ffadff', label: 'con_#{key}-#{WorkProcess.where(:process_code => key).first.name[0,3]}...' }, "}.join + 
        intelligence.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7f7fff', highlight: '#adadff', label: 'int_#{key}-#{WorkProcess.where(:process_code => key).first.name[0,3]}...' }, "}.join + 
        magic.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7fffff', highlight: '#adffff', label: 'mag_#{key}-#{WorkProcess.where(:process_code => key).first.name[0,3]}...' }, "}.join + 
        agility.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7fffbf', highlight: '#adffd6', label: 'agi_#{key}-#{WorkProcess.where(:process_code => key).first.name[0,3]}...' }, "}.join + 
        charm.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#7fff7f', highlight: '#adffad', label: 'cha_#{key}-#{WorkProcess.where(:process_code => key).first.name[0,3]}...' }, "}.join + 
        potential.collect{|key, val| "{value:  #{(val * coefficient).round(2)}, color: '#ffbf7f', highlight: '#ffd6ad', label: 'pot_#{key}-#{WorkProcess.where(:process_code => key).first.name[0,3]}...' }, "}.join.sub(/, \Z/, '') + 
        "]"
    return graphdata
  end
  
end
