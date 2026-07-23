// Normalises options to a promise regardless of whether the caller passed
// a plain JSON object (backward compat) or a Promise<JSON> (new pattern).
let normalizeToPromise: 'a => Promise.t<JSON.t> = %raw(`
  function(value) {
    if (value !== null && typeof value === 'object' && typeof value.then === 'function') {
      return value
    }
    return Promise.resolve(value)
  }
`)
