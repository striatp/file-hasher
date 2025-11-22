.PHONY: compile execute

compile:
	@pwsh ./scripts/compile.ps1 -Source "$(File)"

execute:
	@pwsh ./scripts/execute.ps1