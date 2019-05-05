import React, { Component } from 'react';
import styles from './Template.scss';

/**
 * @author: NAME
 * @date: DATE
 * @description: DESCRIPTION
 */
class Template extends Component {
  constructor(props){
    super(props);
  }

  render() {
    return (
      <div className={styles.wrap}></div>
    );
  }
};

export default Template;
