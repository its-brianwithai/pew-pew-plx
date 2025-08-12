# Open in Xcode

<instruction>
Open the iOS project or file we just worked on in Xcode.
</instruction>

<context>
If it's unclear what to open, ask:
1. iOS project (ios/*.xcworkspace or ios/*.xcodeproj)
2. Specific Swift/Objective-C file
3. Other (specify path)
</context>

<constraints>
- Use `open -a Xcode` command
- Prefer .xcworkspace over .xcodeproj if both exist
- Look in ios/ directory for Flutter projects
</constraints>

Execute: `open -a Xcode {{path}}`