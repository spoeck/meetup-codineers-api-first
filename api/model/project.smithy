$version: "2.0"
namespace de.codineers.project.api
use aws.protocols#restJson1

resource ProjectResource {
    identifiers: { projectId: String },
    operations: [CreateProject, GetProject, UpdateProject, DeleteProject],
    list: ListProjects,
    collectionOperations: [ListProjects]
}

structure Project {
    @required
    @pattern("^[a-zA-Z0-9]+$")
    projectId: String,

    client: String,

    department: String,

    projectLeader: String,

    projectManager: String,

    startDate: String,

    endDate: String,
}

@http(uri: "/projects", method: "POST")
operation CreateProject {
    input: CreateProjectInput,
    output: Project,
}

@idempotent
@http(uri: "/projects/{projectId}", method: "PUT")
operation UpdateProject {
    input: UpdateProjectInput,
    output: Project,
}

@idempotent
@http(uri: "/projects/{projectId}", method: "DELETE")
operation DeleteProject {
    input: DeleteProjectInput,
    output: DeleteProjectOutput,
}

@readonly
@http(uri: "/projects/{projectId}", method: "GET")
operation GetProject {
    input: GetProjectInput,
    output: Project,
}

@readonly
@http(uri: "/projects", method: "GET")
operation ListProjects {
    input: ListProjectsInput,
    output: ListProjectsOutput,
}

structure CreateProjectInput {
    @required
    @pattern("^[a-zA-Z0-9]+$")
    projectId: String,

    @required
    client: String,

    @required
    department: String,

    projectLeader: String,

    projectManager: String,

    @required
    startDate: String,

    @required
    endDate: String,
}

structure UpdateProjectInput {
    @required
    @httpLabel
    @pattern("^[a-zA-Z0-9]+$")
    projectId: String,

    client: String,

    department: String,

    projectLeader: String,

    projectManager: String,

    startDate: String,

    endDate: String,
}

structure DeleteProjectInput {
    @required
    @httpLabel
    @pattern("^[a-zA-Z0-9]+$")
    projectId: String,
}

structure GetProjectInput {
    @required
    @httpLabel
    @pattern("^[a-zA-Z0-9]+$")
    projectId: String,
}

structure DeleteProjectOutput {
    message: String,
}


structure ListProjectsInput {}

structure ListProjectsOutput {
    projects: ProjectList,
}

list ProjectList {
    member: Project
}
