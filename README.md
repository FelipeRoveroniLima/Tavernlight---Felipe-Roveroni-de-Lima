# Project Progress Report

## Friday
After completing the corrections and improvements for the first four questions, I learned how to configure the server (TFS - The Forgotten Server) and client (Edubart's OTClient) inside WSL2. However, I encountered an error related to Opcode 160, which is associated with GameServerPlayerData and might be linked to directly inputting data into the database.

## Saturday
I tried a different approach by configuring the Database, TFS, and Edu's OTClient inside Docker. Since Docker doesn't have a display to run the client, I had to configure the client on WSL2. After several attempts and code readings, I decided to address the supposed database problem with a PHP webpage using ZnoteAAC. I successfully created and locally hosted the website, but after logging in, the website broke, resulting in an HTTP ERROR 500.

## Sunday
I decided it would be best to host everything inside WSL2 for a local test. I reinstalled WSL to ensure a clean start. After setting up the database, server, and client, I once again attempted to set up the webpage using ZnoteAAC and PHP. This time, I encountered an error related to player position and considered checking the next day if switching to a more recent client would resolve the issue.

## Monday
In the morning, I was reviewing the code before switching to an alternative client. As time was running out, I decided to try the Mehah Client, recommended by the OpenTibiaBR team. While waiting for feedback, I progressed in building the other client. After receiving your feedback, I returned to the Original OTClient and tried to find "player" examples to put in the table to see if it would fix the OpCode 160 issue, but unfortunately, I found nothing.

## Tuesday
I tried a different approach by using OpenTibiaBR - Canary to build the server and used Edu's OTClient to run the game. I set up a webpage to log in and create characters, but encountered the same error. Then, I used the GOD account that comes inside the schema.sql of Canary. This time, I encountered an error related to the version. I made some changes in the files to be able to "run" in an older version, but unfortunately, it didn't work. I even asked a member of OTBR, but didn't receive an answer.

## Wednesday
I tried to use another machine to install the server and the client. After some trial and error, I was unable to access the server since I was having some issues with token validation. I tried to contact Edubart via email but still today haven't received any feedback. I searched through many forums and alike to search for any similar problem.

## Thursday
I'm back using my original machine and used TFS and OTClient with the sample characters that come with Canary. I've successfully entered the server after removing the Two-factor auth from the server files, but unfortunately, I've been stuck in the "connecting to the server" message after choosing the character. No info was shown in the terminal of the server nor the client. I tried debugging the server file but with no results.

## Friday
Reserved the last day to revisit the first 4 questions, arranged the GitHub page, and wrote this README file. In the files, there will be comments on the solutions that I provided to these questions and the final files of the server configuration, that were made on Thursday.

## Final Considerations
Unfortunately, I wasn't able to connect to the server and neither reproduce the spells. The trial was fun since I felt challenged on doing research and finding anything that could help me solve the problems. Thank you for the time and opportunity to be able to take this trial.
