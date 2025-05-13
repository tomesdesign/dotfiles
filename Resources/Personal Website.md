Running on https://docs.gitlab.com/user/project/pages/
Problem with not getting HTTPS certificate
- Solved by allowing letsencrypt in https://hosting.blueboard.cz/administrace
	- ![image.png](../assets/image_1743443774209_0.png){:width 300, :height 107}
	- and added CAA record:
		- ![image.png](../assets/image_1743443803666_0.png)
		- 

Problem with 401 for www
- add www.martintomes.net as new domain in pages and verify
- https://forum.gitlab.com/t/error-401-when-using-custom-domain-with-www/38587/4
