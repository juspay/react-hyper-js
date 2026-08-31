// Normalises options to a promise regardless of whether the caller passed
// a plain JSON object (backward compat) or a Promise<JSON> (new pattern).

let normalizeToPromise = (options: JSON.t): Promise.t<JSON.t> => Promise.resolve(options)
