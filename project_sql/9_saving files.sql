/* save table as CSV file.
how to find tmp folder:

	1.	Open Finder.
	2.	Press Command + Shift + G to open the “Go to Folder” dialog.
	3.	Enter /tmp/ and click Go.
	4.	Look for your_file.csv in the folder.
*/

COPY (SELECT* FROM job_postings_fact)
TO '/tmp/my_file.csv' 
WITH (FORMAT CSV, HEADER)