function run
    set file_path $argv[1]
    set file_extension (string match -r '\.[^.]+$' $file_path)

    if test -e "$file_path"
        if test "$file_extension" = ".cpp"
            # Compile and execute C++ source file
            clang++ -o executable "$file_path"; and ./executable
        else if test "$file_extension" = ".py"
            # Execute Python source file
            python "$file_path"
        else if test "$file_extension" = ".java"
            # Compile and execute Java source file
            javac "$file_path"; and java (basename $file_path .java)
        else if contains --substring -- "$file_extension" ".sh" ".bash"
            # Execute shell script
            sh "$file_path"
        else if contains --substring -- "$file_extension" ".rb"
            # Execute Ruby script
            ruby "$file_path"
        else if contains --substring -- "$file_extension" ".js"
            # Execute JavaScript file
            node "$file_path"
        else
            echo "Unsupported file type."
        end

        # Remove generated files
        rm -f executable
        rm -f (basename $file_path .java).class
    else
        echo "File not found: $file_path"
    end
end
