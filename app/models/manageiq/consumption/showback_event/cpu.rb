module ManageIQ::Consumption::ShowbackEvent::CPU
  #
  #  Return the average acumulated with the new one
  #
  def CPU_average(value)
    if @metrics.count>0
      ((value * event_days + @metrics.average(:cpu_usage_rate_average)) / (event_days + 1))
    else
      value
    end
  end

  #
  # Return Number Ocurrences
  #
  def CPU_number(value)
    value
  end

  #
  #  Return the max number of cpu for object
  #
  def CPU_max_number_of_cpu(value)
    numcpus = if resource.class.name.ends_with?("Container")
                resource.vim_performance_states.last.state_data[:numvcpus]
              else
                resource.methods.include?(:cpu_total_cores) ? resource.cpu_total_cores : 0
              end
    [value, numcpus].max.to_i
  end
end
