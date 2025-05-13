---
url: https://naucse.python.cz/2020/nipyt-zima/fast-track/install/
---


title:: Python/Virtualenv
```
mkdir project
$ cd project
$ python -m venv __venv__	*# __venv__ is just a name of the vierualenv folder. tha name could be whatever*
$ . __venv__/bin/activate	*# activation*
(__venv__)$ python -m pip install requests	*# instalation packages inside virtualenv*
(__venv__)$ ...	*# work inside the venv*
(__venv__)$ deactivate	*# deactivate of virtualenv*
```