"use client";
import Image from "next/image";
import Link from "next/link";
import BankBuilding from "../../../../public/bank-building-icon.svg";
import ProfileIcon from "../../../../public/user-profile-icon.svg";

import style from "../../../../styles/component/header.module.css";

export default function Header() {
  return (
    <header className={style.header_component}>
        <div className={style.header_intern_div}>
          <div className={style.header_intern_child}>
            <Link href="/">
              <Image 
                src={BankBuilding.src} 
                height={50} 
                width={50} 
                loading="eager" 
                alt="Bank Building Home Button"
              />
            </Link>
          </div>
          
          <div className={style.header_intern_child}>
            <Link href="/login">
              <Image 
                src={ProfileIcon.src} 
                height={50} 
                width={50} 
                alt="Bank Building Home Button"
              />
            </Link>
          </div>
        </div>
    </header>
  );
}
