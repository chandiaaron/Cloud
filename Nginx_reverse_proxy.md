# Nginx reverse proxy 

## what is a proxy server 

A forward proxy, also known as a proxy, proxy server, or web proxy, is a server that sits in front of a network of client devices. When those machines make requests to Internet sites and services, the proxy server intercepts them and acts as a middleman, communicating with web servers on their behalf.

![proxy server Image](/Images/proxypic.JPG)

### The Benefits of Using a Proxy Server

- Secuirty, the proxy hides the users IP address making it harder for attackers to target it directly. 

- Monitoring and Logging, organisations can monitor internet activity. 




## What is a reverse proxy 

A reverse proxy is a server that sits between users and backend servers, forwarding user requests to the right backend server. 

Lets say you have aaron.com and you want to access different sections of the site :

- Home page (aaron.com) - server A
- Posts page (aaron.com/posts) - server B 
- Images (aaron.com/images) - server C 

A reverse proxy manages all these requests. 

### The Benefits of Using a Reverse Proxy Server

- Security, hides backend servers, preventing DDos attacks. 

- Load Balancing, distributes traffic across multiple backend servers preventing overload. 




| **Use Case** | **Forward Proxy** | **Reverse Proxy** |
|-------------|----------------|----------------|
| Hiding user identity | ✅ Yes | ❌ No |
| Controlling outbound traffic (e.g., filtering, monitoring) | ✅ Yes | ❌ No |
| Hiding server IPs & protecting backend infrastructure | ❌ No | ✅ Yes |
| Load balancing across multiple servers | ❌ No | ✅ Yes |
| Improving website speed & caching responses | ❌ No | ✅ Yes |


