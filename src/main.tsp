import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi";
import "@typespec/openapi3";
import "@typespec/versioning";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.Versioning;

@service(#{ title: "Bibimbap Documentation" })
@server("https://bibimbap.io", "Single server endpoint")
@doc("""
  <img src=\"/bibimbap-documentation/favicon-96x96.png\" width=\"250\"/>
  <h2>Welcome to Bibimbap Project</h2>
  <p>In the ever-evolving landscape of competitive programming, the need for a robust and versatile platform to create and manage contest problems is paramount. Enter Bibimbap—an innovative platform designed to revolutionize the way programming contest problems are created, curated, and managed. Heavily inspired by Polygon, a widely respected tool in the competitive programming community, Bibimbap aims to provide an enhanced, user-friendly experience for problem setters and contest organizers alike.</p>
  """)
@info(#{
  contact: #{ name: "Bibimbap Team", url: "https://github.com/Bibimbap-Team" },
  license: #{
    name: "MIT",
    url: "https://github.com/Bibimbap-Team/bibimbap-backend/blob/main/LICENSE",
  },
})
namespace DemoService;

model Widget {
  id: string;
  weight: int32;
  color: "red" | "blue";
}

model WidgetList {
  items: Widget[];
}

@error
model Error {
  code: int32;
  message: string;
}

model AnalyzeResult {
  id: string;
  analysis: string;
}

@route("/widgets")
@tag("Widgets")
interface Widgets {
  /** List widgets */
  @get list(): WidgetList | Error;
  /** Read widgets */
  @get read(@path id: string): Widget | Error;
  /** Create a widget */
  @post create(@body body: Widget): Widget | Error;
  /** Update a widget */
  @patch update(@path id: string, @body body: Widget): Widget | Error;
  /** Delete a widget */
  @delete delete(@path id: string): void | Error;

  /** Analyze a widget */
  @route("{id}/analyze") @post analyze(@path id: string): AnalyzeResult | Error;
}
