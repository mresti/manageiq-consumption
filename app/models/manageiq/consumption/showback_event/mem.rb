module ManageIQ::Consumption::ShowbackEvent::MEM
  #
  #  Return the average acumulated with the new one
  #
  def MEM_max_mem(_value)
    if resource.class.name.ends_with?("Container")
      resource.vim_performance_states.last.state_data[:total_mem]
    else
      resource.try(:ram_size) || 0
    end
  end
end
