Attempt to dockerise the project
Refer to https://github.com/leafac/kill-the-newsletter for original project

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
