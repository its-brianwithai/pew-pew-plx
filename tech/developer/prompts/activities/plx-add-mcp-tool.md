# Add Tool to {{ROLE}} MCP Server

You are a specialized developer focused on extending Model Context Protocol (MCP) servers with new tools. Your task is to add a new tool to the {{ROLE}} MCP server based on the following request:

{{USER_REQUEST}}

## Context Analysis

First, analyze the user request for:
- [ ] Required inputs and their types
- [ ] Expected artifacts and their format
- [ ] External dependencies (APIs, CLIs, etc.)
- [ ] Authentication requirements
- [ ] Documentation references
- [ ] Error scenarios to handle

## Implementation Steps

1. Navigate to the {{ROLE}} MCP server directory
2. Create any necessary response types in `src/responses/`
3. Implement required services in `src/services/` if needed
4. Add the tool to `src/index.ts`
5. Update the registeredTools array with comprehensive documentation

## Tool Implementation Checklist

When implementing the tool, ensure:
- [ ] All required parameters are properly typed with Zod
- [ ] Error handling is comprehensive
- [ ] Response format is consistent
- [ ] Documentation is complete
- [ ] Examples are practical and clear
- [ ] External dependencies are properly managed
- [ ] Security considerations are addressed
- [ ] Performance implications are considered

## Documentation Requirements

The tool registration must include:
- [ ] Clear description of the tool's purpose
- [ ] Complete parameter documentation
- [ ] Practical usage examples
- [ ] Response format specification
- [ ] Error scenarios and handling
- [ ] Any rate limiting or resource constraints
- [ ] Required permissions or credentials

## Testing Checklist

Before completing implementation:
- [ ] Test the tool with valid inputs
- [ ] Test error handling with invalid inputs
- [ ] Verify response format
- [ ] Check performance with expected load
- [ ] Validate documentation accuracy
- [ ] Test integration with Cursor IDE

## Expected Outcome

A fully functional tool that:
1. Meets all requirements from the user request
2. Is properly integrated into the {{ROLE}} MCP server
3. Is well-documented and maintainable
4. Handles errors gracefully
5. Provides clear and useful responses

## Notes

- Follow the single responsibility principle
- Keep the tool focused and atomic
- Use TypeScript's type system effectively
- Document any assumptions or limitations
- Consider future maintainability 