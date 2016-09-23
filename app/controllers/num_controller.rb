class NumController < ApplicationController
	def home
	end

	def collect_num
		# Storing the params in a variable @sign
		@sign = params[:sign]

		# This is a conditional to regulate and avoid entry of negative values for days and then storing the appropriate   value in @days variable
		if ((params[:days].to_i >= 0) && (params[:days] != ""))
			@days = params[:days]
		else
			redirect_to root_path
		end

		# This is a conditional to specify the operations of each option "Add" or "Subtract" in the dropdown and streamline it with the numerical operations
		if @sign == "Add"
			@this_day = Date.today.next_day(n = @days.to_i).wday
		else
			@this_day = Date.today.next_day(n = (- @days.to_i)).wday
		end

		# Conditionals to determine which day of the week the @this_day (above) falls into
		@week_day = if @this_day == 0
				  "Sunday"
			    elsif @this_day == 1
			          "Monday"
			    elsif @this_day == 2
			          "Tuesday"
			    elsif @this_day == 3
			          "Wednesday"
			    elsif @this_day == 4
			          "Thursday"
			    elsif @this_day == 5
			          "Friday"
			    else
			          "Saturday"
			    end

		# Conditionals to specify the operations of @full_date if certain option is chose from the dropdown
		if @sign == "Add"
			@full_date = (Date.today) + (@days.to_i)
		else
			@full_date = (Date.today) - (@days.to_i)
		end

	end
end
