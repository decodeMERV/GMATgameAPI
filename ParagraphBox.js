import React from 'react';
import './ParagraphBox.css';

export default (props) => {
    return (
        <div
          style=
          {{
            backgroundColor: props.bgColor ? props.bgColor : "white",
            color : props.color ? props.color : "white",
            fontSize : props.fontSize ? props.fontSize : "1rem",
            // width : props.width ? props.width : "30%",
          }}
          className="textbox"
          onClick={props.onClick}
        >
          <p>{props.theText}</p>
        </div>
    )
}
