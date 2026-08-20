// Normalises options to a promise regardless of whether the caller passed
// a plain JSON object (backward compat) or a Promise<JSON> (new pattern).
let normalizeToPromise = (value): Promise.t<JSON.t> => {
  let dict: dict<unknown> = value->Obj.magic
  switch dict->Dict.get("then") {
  | Some(_) => value->Obj.magic
  | None => Promise.resolve(value->Obj.magic)
  }
}
