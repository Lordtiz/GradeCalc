CIS11 Course Project Part 1: Documenting the Project
Fill in the following areas (purple).
Introduction
Purpose
The purpose of this project is to display the minimum, maximum and average of 5 test scores. 
Intended Audience and Users
The primary audience/user is primarily used for teachers/professors, and students.
Product Scope
What is the intention of this program? 
The Test Score Calculator is intended to aid students, and teachers with their calculations. It provides a foundation for these individuals to check their work, or the average of their grade, and even provide an accurate calculation if there was a mistake made. 
Reference  
Source Documents for the Program Requirements and Specification
Reference Project requirements  and LC-3 specifications.
Chapter 9 and 10 Notes 
https://rccd.instructure.com/courses/21639/files/1860543/download?wrap=1
CIS – 11 Chapter 14 and Chapter 16 Notes 
https://rccd.instructure.com/courses/21639/files/2977422/download?wrap=1
Computer Systems:  LC# Traps and Subroutines 
http://jeremybolton.georgetown.domains/courses/cs/COSC121_L1d_LC3_Trap_Subroutines.pdf
Logic Design Transistors and Gates 
https://www2.seas.gwu.edu/~bhagiweb/cs2461/lectures/Logic1.pdf
Companion Application Requirements Documents (If applicable)
	What other documents should be reviewed with this document?
CIS11_Chapter_5_Notes – 1.docx
Min, Max, Average 
http://faculty.salina.kstate.edu/tmertz/Java/044programmingwithcontrolstatements/07maxminaverage.pdf
LC-3 Instruction Summary 
http://faculty.lasierra.edu/~ehwang/courses/cptg245/LC3/LC-3%20Instructions.pdf
Chapter 5: The LC3 
https://www.cis.upenn.edu/~milom/cse240-Fall05/handouts/Ch05.pdf
CIS11 Chapter 8 Notes https://rccd.instructure.com/courses/21639/files/1860533/download?wrap=1
2. Overall Description
2.1 Product Perspective
Primary program objectives

The CIS provides:
	A system for students and teachers to have access to: 
        an accurate calculation of their scores for either their grades, or the class’ overall performance
       provides an accurate projection of a students grade if the student was curious about their performance in the class
    Product Functions
The overall description of functionality:
Highlight the program functionality: Identify tasks and subtasks of the program in summary.
Provides the user the opportunity to input their test scores 
Stores the information that was inputted 
From the information that was inputted from the user, the information then goes into a subroutine to get the maximum, minimum, average, and letter grade 
When the system subroutines to provide the minimum, maximum and the average, the system loops five times and stores the information 
Once they system stores the information for minimum, maximum and the average the system then checks the possible outcome of the letter grade based off the average. When this is done, it then stores the information of the letter grade 
Then the system displays the output based off the user input. 

Technical functionality
A configurable toolkit of functions including: 
What are the technical functions of the program? Subroutines and operations.
	
 Ability to store the information from the user 
Ability to configure 5 numbers to provide an accurate calculation of maximum, minimum, average and provide a letter grade 
Ability to display an error message if the numbers are not inputted correctly (ex. Abc instead of 123) 

User Classes and Characteristics
Who are involved in this development process? Include business and technical personnel and their tasks.
Students
Help with calculations and provide accurate average of their grade(s)

Professors/Teachers 
Can easily provide their students’ performance
Displays an accurate average, max, and min without having to hand calculate 
  
Operating Environment
What type of system will the application be operated on? Operating system? System types? Development platform? 
The system the application will be operated on is a PC. Needs to have access to an LC3 simulator. 
Design and Implementation Constraints
Note any constraints or limitation to the application.
Access to the software is required. It is not able to run on other platforms other than LC-3 simulator, or GitHub. Another restraint that it may have difficulties with floating numbers (1.23 etc..). It can potentially give out the wrong data with floating numbers. 
Assumptions and Dependencies
Note any dependencies
 It is assumed that the user can use an LC-3 simulator, along with providing user input, and following the directions provided on the screen. 
3. External Interface Requirements
User Interfaces
How will the user interface with your program? Menus? Access prompt? Links? Icons?
	The user will interface with the program by prompts, and user input. 
Hardware Interfaces
Specify hardware interface – computer types? Terminal types? 
Can be used on any computer that has access to the LC-3 simulator. This can be used on windows, and MAC
Software Interfaces
Specify additional software interface – if any. What type of software will the application require to run?
The software the application will need to run is an LC3 simulator. You absolutely need an LC3 simulator to run the code. 

Communications Interface
Does your application require web, Internet or network connectivity? If so, which browser? What type of network connection?
The application may require internet connection, but more than likely will not need any internet, unless ran coded through an online simulator 
 
4. Detailed Description of Functional requirements
4.1     Type of Requirement (summarize from Section 2.2)
What are the functions? Their purposes? Inputs? Outputs? Data? Where is the data stored (internal or external to the application)? 
 
Information From User 
Purpose: To get information from the user to display the scores
 
Inputs: Inputs are through the keyboard and mouse clicks.
 
Processing:  The input is validated using server- side validation. The user will be able to input 5 test scores, if entered correctly. If anything other than a number is inputted by the user, an error message should display and ask the user to input a valid test score. 
 
Outputs: The next line of “Enter Test Score” should be displayed if the        user input is validated 

Data: Test Scores Data Base 
 
 
Analysis Requirement
Purpose: The scores will be displayed based off of user input. 

Inputs: The system will ask the user for 5 test scores (typically 1-100)
 
Processing:  Typically, the system will take approx. 1-2 seconds to process through. It will go through several subroutines to get the min, average, max, and the letter grade. If an error occurs, the system will display an error message to the user. 
Side Note: If the user inputs anything other than numbers the system will display an error message, and will restart the program.
 
Outputs: The outputs will be the max, min, average, and the letter grade.


 
4.2 Performance requirements
 What is the expected performance level of the program?
4.2.1 The application should be able to handle and adjust to any possible run time errors 
4.2.2 Since the program is displaying the letter grades associated to the input of the user, the run time should be around 2-5 seconds. Varies on how big the numbers are. 
4.2.3 The data base should be able to provide min, max, average and the letter grade. 
 4.3 Flow Chart and Pseudocode.




























 

	
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

	
 
 
 
 
 
 
 
 
 
 
 
 CIS11 Project Part 1 Team Task Assignment:
 
Team Name: Buzz, Woody and Jessie
Team Members: Julio Ortiz, Francisco (Danny) Dominguez, Angelique (Angie) Lopez
Allocated Tasks for each member:
Julio – Code
Angie – Any documentation
Danny – Psdeudocode and Flowchart
GitHub – Julio, Angie, Danny (Julio or Angie should be able to turn in link)
Projected Task Completion Timeline: *Provide an estimate timeline for each assigned individual and task below.
Flowchart – May 17th (the latest)
Psuedocode – May 25th
Team Task Assignment – May 15th
Documentation – May 24th (The 25th would be the day to review)
For everything else, the preferred deadline would be June 8th to review and organize everything that we have.
 
 




