## [Unreleased]

## [0.3.0] - 2025-01-06

### Changed
- **BREAKING**: Migrated from Shopify App Bridge V3 to V4
- Replaced `useLocale()` hook with `useAppBridge()` and `shopify.config.locale`
- Updated import from `@shopify/app-bridge-react` to use `useAppBridge` instead of `useLocale`
- Maintained backward compatibility with optional chaining for safer locale access

### Migration Notes
- Host applications using this gem should ensure they are using Shopify App Bridge V4
- The component maintains the same API and behavior for end users
- No changes required for existing implementations

## [0.2.1] - Previous Release

## [0.1.0] - 2022-11-14

- Initial release
