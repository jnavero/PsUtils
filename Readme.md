Various Powershell utilities
---

**CreateBinding443**: Create the 443 binding in IIS if it does not exist.
- I use this in .net core and visual studio projects as the binding gets lost from time to time.
In pre build event:
```
powershell -NoProfile -ExecutionPolicy RemoteSigned -file $(SolutionDir)\..\CreateBinding443.ps1
```

