$version: "2.0"
namespace de.codineers.project.api
use aws.protocols#restJson1
use smithy.framework#ValidationException

@title("codineers-project-api")
@restJson1
service Api {
    version: "2024-06-20",
    resources: [ProjectResource]
}
