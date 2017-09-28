# Errors

KROSS API는 아래의 오류코드를 사용합니다.


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request invalide.
401 | Unauthorized -- Your API key is wrong.
403 | Forbidden -- The API requested is hidden for administrators only.
404 | Not Found -- The specified request could not be found.
405 | Method Not Allowed -- You tried to access a URL with an invalid method.
406 | Not Acceptable -- You requested a format that isn't json.
410 | Gone -- The URL requested has been removed from our servers.
418 | I'm a teapot.
429 | Too Many Requests -- You're requesting too many! Slow down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.

