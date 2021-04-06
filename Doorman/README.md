*****		*****
**** Doorman ****
*****		*****

Hello User,

Doorman is a simple application to show off encryption of passwords on sign-up and verification against encrypted passwords to login.
3 fields, 2 mandatory for "Login" and 1 extra mandatory for "signup".
A status bar exists that is color coded to indicate what is happening behind the scenes.
	-Green: Successful Action Taken
	-Yellow: Possible Issue
	-Red: Error
Messages associated with actions will appear.
Packaged as a War file.
Deployable on Tomcat 9.0 while using XAMPP 8.0.3. Java version targeted Java 8.
Target is for BCrypt libary.
Developed using Eclipse and localhost as server.
Mysql database provided by XAMPP.

Processes:
	SignUp User> Enter new unique Username(email), enter Password, give a Moniker. Hit Sign-Up button.
		- Problems:
			-- Username is not in email format.
			-- Missing Moniker.
			-- Moniker too long.
			-- Username previously registered.
		- Error:
			-- SQL Error.
	SignIn User> Enter registered unique Username(email). Enter Password. Hit Login Button.
		- Problems:
			-- Username is not in email format.
			-- Username is not previously registered.
		- Error:
			-- SQL Error.
			-- Username and Password do not match.
		

Fields:
	Username - The email address used when signing-up or signing-in. Regex checked in both instances.
	Password - The password associated with Username when signing-up/in.
	Moniker - The name to be associated with a created account. Max Length of 21 characters. Mandatory when signing up. Unused when signing-in.
