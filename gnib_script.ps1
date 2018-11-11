$Url = "Get the URL of the appointmnet type required"
$j=Invoke-WebRequest -Uri $Url
$jParsed = $j | ConvertFrom-Json 
$EmailFrom = "Sender email" 
$EmailTo = "Receiver email" 
$Body = "Change as needed"  
$SMTPServer = "smtp.gmail.com"  
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)  
$SMTPClient.EnableSsl = $true  
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("SEmail's username without @domain", "Email's password")
while($jParsed.empty -eq 'TRUE'){$jParsed=Invoke-WebRequest -Uri $Url | ConvertFrom-Json
if($jParsed.empty -ne 'TRUE'){$SMTPClient.Send($EmailFrom, $EmailTo, "Available appointment", ($jParsed | ConvertTo-Json))}}$SMTPClient.Send($EmailFrom, $EmailTo, "Error", ($jParsed | ConvertTo-Json))
