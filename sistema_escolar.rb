@students_array = []
#loading effect
def loading_effect()
    1.times do
        print "."
        sleep(0.5)
        print "."
        sleep(0.5)
        print "."
        sleep(0.5)
        print "\n"
    end
end
#Create student
def add_student()
    puts "Do you want to add somebody?(Y/N)"
    choice = gets.chomp.to_s.upcase
    if choice == "Y"
        puts "Write the student name: "
        std_name = gets.chomp.to_s.upcase
        @students_array << {name:std_name, score: "No scored"}
        loading_effect
        puts "Student successfully created!"
        puts ""
    else
        puts "Leaving"
        loading_effect()
    end
    menu()
end
#Add the score to selected student
def add_student_score()
    puts "Do you want to add the score for?"
    proposal_student = gets.chomp.to_s.upcase
    for student in @students_array
        if proposal_student == student[:name]
            puts "Student found!\nWrite the first score: "
            first_score = gets.chomp.to_f
            puts "Write the last score: "
            second_score = gets.chomp.to_f
            score_list = [first_score, second_score]
            for score in score_list
                if score >= 0 and score <= 10
                    next
                else
                    puts "Inválid score, please put only valid scores"
                    add_student_score
                end
            end
            result = (first_score + second_score) / 2
            student[:score] = result
            loading_effect()
            puts "Score added!"
            menu()
        else
            next
        end
    end
    puts "Student not found!\n returning to menu"
    loading_effect()
    menu()  
end

#Check student list, one or all class
def check_students()
    count = 0
    puts "Do you want to check a student(1) score or all class(2)?"
    choice = gets.chomp.to_i
    if choice == 1
        puts "What is the student name?"
        student_name = gets.chomp.to_s.upcase
        @students_array.each do |student|
            if student_name == student[:name]
                loading_effect
                puts student
                puts ""
            else
                next
            end
        end
    elsif choice == 2
        puts @students_array
        puts ""
    end
    menu()
end

#Edit score and/or student name
def edit_student()
    puts "What do you want to edit?\n1.Name\n2.Score\n0.Leave to menu\n"
    choice = gets.chomp.to_i
    if choice == 1
        puts "Write the student's name: "
        student_name = gets.chomp.to_s.upcase
        @students_array.each do |student|
            if student_name == student[:name]
                puts "Student found!\nWrite the new name: "
                new_name = gets.chomp.to_s.upcase
                student[:name] = new_name
                loading_effect
                puts "Name edited!"
                edit_student()
            end
            puts "Student not found, returning to edit option"
            edit_student()
        end
    elsif choice == 2
        puts "Write the student's name: "
        student_name = gets.chomp.to_s.upcase
        @students_array.each do |student|
            if student_name == student[:name]
                puts "Student found!\nWrite the new score: "
                new_score = gets.chomp.to_f
                student[:score] = new_score
                loading_effect
                puts "Score edited!"
                edit_student()
            end
        end
    elsif choice == 0
        puts "returning to menu"
        loading_effect
        menu()
    else
        loading_effect
        puts "The option doesn't existe. Please select a valid option"
        edit_student()
    end
end
#delete student
def delete_student()
    puts "Do you really want to edit a student?(Y/N)"
    choice = gets.chomp.to_s.upcase
    if choice == "Y"
        puts "Write the student's name to be deleted: "
        student_name = gets.chomp.to_s.upcase
        @students_array.each do |student|
            if student_name == student[:name]
                @students_array.delete(student)
                puts "Student deleted successfully!"
                puts ""
                menu()
            end
        end
        puts "Student not found!"
        delete_student()
    elsif choice == "N"
        puts "Returning to menu"
        loading_effect
        menu()
    else
        puts "Write only Y or N"
        delete_student()
    end
end
def menu()
    puts "Write the referenced number:\n1.Add student\n2.Add score\n3.Check students\n4.Edit student\n5.Delete student\n0.Exit"
    choice = gets.chomp.to_i
    if choice == 1
        add_student() 
    elsif choice == 2
        add_student_score()
    elsif choice == 3
        check_students()
    elsif choice == 4
        edit_student()
    elsif choice == 5
        delete_student()
    elsif choice == 0
        exit
    else
        puts "Write only numbers in menu"
        menu()
    end
end

menu()