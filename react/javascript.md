# JavaScript

## Concurrency model nd the event loop

- [MDN - Concurrency model and the event loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop#Run-to-completion)

## Promises

- [MDN - Using Promises](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises)
- [MDN - Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise)
- [Google - JavaScript Promises: an Introduction](https://developers.google.com/web/fundamentals/primers/promises)

### Guarantees

- Callbacks will never be called before the completion of the current run of the JavaScript event loop.
- Callbacks added with then() even after the success or failure of the asynchronous operation, will be called, as above.
- Multiple callbacks may be added by calling then() several times. Each callback is executed one after another, in the order in which they were inserted.

### Syntax

```javascript
// Method 1 (older): `.then` on a promise
const fetchDataThen = () => {
  fetch('https://api.github.com').then(resp => {
    resp.json().then(data => {
      console.log(data)
    });
  });
};

fetchDataThen();

// Method 2 (newer): Async and await
const fetchDataAsyncAndAwait = async () => {
  const resp = await fetch('https://api.github.com');
  const data = await resp.json();

  console.log(data);
};

fetchDataAsyncAndAwait();
```

## Fetch API

- [MDN - Using Fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)
- [MDN - Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)
