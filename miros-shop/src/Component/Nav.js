import styled from "styled-components"
import { NavLink } from "react-router-dom"
import logo from "../miros.png"
import { SiShopware } from "react-icons/si"


const Nav = () => {
  return(
      <div className="nav">
          <div>
            <h1><SiShopware /> Miros</h1>
            <nav className="navbar">
                <NavLink to = "/" className="link">EXPLORER</NavLink>
                <NavLink to = "/" className="link">CATEGORIES</NavLink>
                <NavLink to = "/" className="link">MON COMPTE</NavLink>
                <button className="linkbtn">CREATE STORE</button>
            </nav>
          </div>
          {/* <form>
                <input type="text" className="search"></input>
                <input type="submit" className="submit"></input>
          </form> */}
      </div>
  );
}

export default Nav;