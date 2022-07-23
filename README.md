Attempt to dockerise the project  
Refer to https://github.com/leafac/kill-the-newsletter for original project  

Refer only to the Dockerfile for this attemp, the remaining files in this repo are just from the original project.  

Not working. Setup was fine all the way until reverse proxy, where the app sets up it's own reverse proxy instead of leaving it up to the user.  
Using nginx proxy manager at the moment. 
Might want to try vm install next. 

Log shows the below:  
Kill the Newsletter!/1.0.1  
   ⚙️    ❨auto-encrypt❩ Configuration initialised.  
   📃    ❨auto-encrypt❩ Certificate does not exist; will be provisioned on first hit of the server.  
Configuration loaded from ‘/config/configuration.js’.  
   🔒    ❨auto-encrypt❩ HTTP server is listening on port 80.  
Email server started  
   👉    ❨auto-encrypt❩ Redirecting HTTP request to HTTPS.  
   👉    ❨auto-encrypt❩ Redirecting HTTP request to HTTPS.  
