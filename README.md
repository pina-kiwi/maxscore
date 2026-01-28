# README for Maxscore Validation Script

## Author Information
- **Name:** [Laura Beatty]
- **Course:** [CENG 298]
- **Assignment:** Maxscore Assignment
- **Date:** [01.27.2026]

## Program Description
[Write 2-3 sentences in your own words describing what this script does and its purpose. Explain the problem it solves and how it works at a high level.]
This program takes a total of 5 integers and stores them in an array. Then it finds the largest number and calculates the difference between it and the others.

## Usage
To run the script interactively:
```bash
./maxscore.sh
```

To test with the provided input file:
```bash
./maxscore.sh < maxscore-input
```

## How the Script Works
[Explain in 3-5 sentences how your script works. Include information about:]
- How you read and store numbers in an array
- How you loop through the array to find the maximum value
- How you calculate and display the difference between each score and the highest
In order to use an arrary you have to declare it which I used "declare -a score." This shows that it is going to be a numbered array. I used a for loop to loop through the array and compared the each input number to the perious max and if it was larger set it to the max variable. I then did another for loop to go through each of the array inputs and set a variable called difference I then used to print out the difference. 

## Testing Results
[Describe your testing process and results. Include:]
- Example successful inputs and results
- How you used the maxscore-input file to test
Example code:
Enter 5 scores, each followed by enter
50
30
20
15
13
The highest score is 50.
The scores are:
50 differs from max by 0
30 differs from max by 20
20 differs from max by 30
15 differs from max by 35
13 differs from max by 37

To input the maxscore-input instead of "./maxscore.sh" you instead do "./maxscore.sh < maxscore-input" to produce:
Enter 5 scores, each followed by enter
The highest score is 92.
The scores are:
75 differs from max by 17
88 differs from max by 4
92 differs from max by 0
60 differs from max by 32
85 differs from max by 7

## Challenges and Solutions
[Optional: Describe any challenges you encountered while creating this script and how you solved them. This could include debugging issues, arrays, or Git workflow problems.]

Understanding shellchecks error and figuring out how to work with arrays in bash. 

## Resources
[List any resources you used (class slides, ChatGPT, etc.). Please refer to the course syllabus for more details on citations.]
https://www.gnu.org/software/bash/manual/html_node/Arrays.html

chatgpt prompt:
shellcheck maxscore.sh In maxscore.sh line 13: read -r score[i] ^------^ SC2313 (warning): Quote array indices to avoid them expanding as globs. For more information: https://www.shellcheck.net/wiki/SC2313 -- Quote array indices to avoid them...

answer:
Great catch running shellcheck 👏 — and also: this one is a warning, not an error, which is important.

Let’s unpack it calmly.

What SC2313 is actually saying

ShellCheck sees this:

read -r score[i]


and worries that i might expand as a glob (*, ?, etc.) in some weird edge case.

So it suggests quoting the index.

👉 Your script already works correctly.
This warning is about defensive coding, not a bug.

The ShellCheck-approved version ✅

To silence the warning, quote the index like this:

read -r score["$i"]


And then consistently use quoted indices everywhere:

${score["$i"]}

## License
This project is part of coursework for Chapman University and is intended for educational purposes.
