import styled from "styled-components"
import { useState } from "react"
import { NavLink } from "react-router-dom"
import logo from "../miros.png"
import { SiShopware } from "react-icons/si"
import { FaSearch } from "react-icons/fa"
import { GiHamburgerMenu } from "react-icons/gi"
import { FaUserAlt } from "react-icons/fa"


const Nav = () => {

  const [left, setLeft] = useState(100);

  const displayNav = () => {
    if (left === 100)
      setLeft(0);
    else
      setLeft(100);
    
  }

  const Div = styled.div `
  p {
    display: none;
  }

  @media screen and (max-width: 992px) {
    .navbar {
      position: absolute;
      top: 0;
      height: 100%;
      width: 100%;
      opacity: 0.7;
      display: flex;
      flex-direction: column;
      background: blue;
      left: ${left}%;
    }

    P {
      display: block;
      color: white;
      font-size: xx-large;
      z-index: 1;
      margin-right: 2rem;
    }
  }
  `
  
  return(
      <fragment className="nav">
          <Div>
            <h1><SiShopware /> Miros</h1>
            <p > <GiHamburgerMenu onClick = {displayNav} /> </p>
            <nav className="navbar">
                <NavLink to = "/" className="link">EXPLORER</NavLink>
                <NavLink to = "/" className="link">CATEGORIES</NavLink>
                <NavLink to = "/" className="link"><FaUserAlt/></NavLink>
                <button className="linkbtn">CREATE STORE</button>
            </nav>
          </Div>
          <form>
                <input type="text" className="search" placeholder="recherche"></input>
                <button className="submit"><FaSearch/></button>
          </form>
      </fragment>
  );
}

export default Nav;