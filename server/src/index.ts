import bodyParser from "body-parser";
import express, { Request, Response } from "express";
import * as fs from "fs";
import swaggerUi from "swagger-ui-express";

const app = express();
const port = 5555;

// Middleware
app.use(bodyParser.json());

// Temporary data storage
const projects: { [key: string]: any } = {};

// Routes
app.get("/projects", (req: Request, res: Response) => {
  res.json(Object.values(projects));
});

app.post("/projects", (req: Request, res: Response) => {
  const project = req.body;
  projects[project.projectId] = project;
  res.json(project);
});

app.get("/projects/:projectId", (req: Request, res: Response) => {
  const project = projects[req.params.projectId];
  if (project) {
    res.json(project);
  } else {
    res.status(404).json({ message: "Project not found" });
  }
});

app.put("/projects/:projectId", (req: Request, res: Response) => {
  const projectId = req.params.projectId;
  const project = req.body;
  projects[projectId] = project;
  res.json(project);
});

app.delete("/projects/:projectId", (req: Request, res: Response) => {
  const projectId = req.params.projectId;
  delete projects[projectId];
  res.json({ message: "Project deleted" });
});

// Swagger setup
const swaggerDocument = JSON.parse(
  fs.readFileSync(
    // /Users/spoeck/GitHub/meetup-codineers-api-first/api/build/smithy/source/openapi/Api.openapi.json
    "../api/build/smithy/source/openapi/Api.openapi.json",
    "utf8"
  )
);
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Start server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
