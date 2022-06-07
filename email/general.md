**encoding**

Email is encoded with "quoted-printable" encoding
- max line length is 998 chars
- a \n WILL BE inserted every 998 chars even if it's in the middle of your content

(helpful link)[https://stackoverflow.com/questions/11720270/how-to-change-the-mailer-content-transfer-encoding-settings-in-rails]