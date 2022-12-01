/**
 * Render Props:
 * 
 * Pass a function that renders a component
 */

import React, {useState, useEffect} from "react";

/**
 * NOTE the fetch component render prop is a function that renders a component
 * that accepts a comment passed in from the FetchComment component via its
 * internal state
 */
function App() {
  return (
    <div>
      <FetchComment render={(comment) => <Comment comment={comment} />}/>
    </div>
  );
}

function FetchComment({render}) {
  const [comment, setComment] = useState();

  useEffect(() => {
    fetch("/comments").then((res) => {
      return res.json()
    }).then(json => {
      setComment(json);
    })
  }, []);

  return (
    <>
      {render({comment})}
    </>
  );
}

function Comment({comment}) {
  return (
    <div>
      <p>{comment.text}</p>
    </div>
  )
}