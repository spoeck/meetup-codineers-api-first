# Meetup Demo

## API

### install smithy
```
brew tap smithy-lang/tap && brew install smithy-cli
```

### generate OpenAPI
```
# in api folder
smithy build
```

## Server

### install dependencies
```
# in server folder
npm i
```

### start
```
# in server folder
npm start
```

### data for example request
```json
{
	"projectId": "P0001",
	"client": "Space Y",
	"department": "Software Engineering",
	"projectLeader": "Peter Lustig",
	"projectManager": "Benjamin Blümchen",
	"startDate": "2024-07-01",
	"endDate": "2024-10-31"
}
```