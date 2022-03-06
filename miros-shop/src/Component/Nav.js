import styled from "styled-components"
import { NavLink } from "react-router-dom"
import logo from "../miros.png"
import { SiShopware } from "react-icons/si"
import { FaSearch } from "react-icons/fa"
import { FaUserAlt } from "react-icons/fa"


const Nav = () => {
  return(
      <div className="nav">
          <div>
            <h1><SiShopware /> Miros</h1>
            <nav className="navbar">
                <NavLink to = "/" className="link">EXPLORER</NavLink>
                <NavLink to = "/" className="link">CATEGORIES</NavLink>
                <NavLink to = "/" className="link"><FaUserAlt/></NavLink>
                <button className="linkbtn">CREATE STORE</button>
            </nav>
          </div>
          <form>
                <input type="text" className="search" placeholder="recherche"></input>
                <button className="submit"><FaSearch/></button>
          </form>
      </div>
  );
}

export default Nav;