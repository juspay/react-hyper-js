// Normalises options to a promise regardless of whether the caller passed
// a plain JSON object (backward compat) or a Promise<JSON> (new pattern).

let normalizeToPromise = (options: JSON.t): Promise.t<JSON.t> => Promise.resolve(options)

@val @scope("crypto") external randomUUID: unit => string = "randomUUID"

let useWidgetId = id => {
  let generated = React.useRef("")
  let (generatedId, setGeneratedId) = React.useState(() => "")
  // Keep server output and the first client render identical. Generate the ID
  // after hydration; callers wait for it before mounting the browser widget.
  React.useEffect1(() => {
    if id === "" {
      if generated.current === "" {
        let uniqueId = try randomUUID() catch {
        | _ => Js.Math.random()->Js.Float.toString->Js.String2.replace(".", "")
        }
        generated.current = `widget-${uniqueId}`
      }
      setGeneratedId(_ => generated.current)
    }
    None
  }, [id])
  id === "" ? generatedId : id
}
