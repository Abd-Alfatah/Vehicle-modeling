import ftplib

# Connect to the FTP server
ftp = ftplib.FTP()
ftp.connect('ftp.python.org', 21)

# Log in to the FTP server anonymously
ftp.login('', '')

# Open a file for writing
f = open('ftp75-1877s.txt', 'wb')

# Retrieve the file from the FTP server and write it to the local file
ftp.retrbinary('RETR ftp75-1877s.txt', f.write)

# Close the file and the FTP connection
f.close()
ftp.close()
