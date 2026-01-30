"use client";

import Image from "next/image";

export function Header() {
  return (
    <header className="border-b border-gray-100 bg-white sticky top-0 z-50">
      <div className="max-w-[1480px] mx-auto px-4 lg:px-[120px]">
        <div className="flex items-center justify-between h-20">
          <div className="flex items-center gap-2">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none">
              <path d="M16 4C9.373 4 4 9.373 4 16s5.373 12 12 12 12-5.373 12-12S22.627 4 16 4z" fill="#d77f82"/>
              <path d="M12 14a2 2 0 1 0 0-4 2 2 0 0 0 0 4zM20 14a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" fill="white"/>
              <path d="M16 20c2.761 0 5-1.567 5-3.5h-10c0 1.933 2.239 3.5 5 3.5z" fill="white"/>
            </svg>
            <span className="text-2xl font-semibold text-gray-900">WellMum</span>
          </div>

          <nav className="hidden md:flex items-center gap-8">
            <a href="#our-story" className="text-gray-600 hover:text-gray-900 transition-colors">
              Our Story
            </a>
            <a href="#blog" className="text-gray-600 hover:text-gray-900 transition-colors">
              Blog
            </a>
            <a href="#contact" className="text-gray-600 hover:text-gray-900 transition-colors">
              Contact
            </a>
          </nav>

          <div className="flex items-center gap-4">
            <select className="px-4 py-2 border border-gray-200 rounded-lg bg-white text-gray-700 cursor-pointer">
              <option>EN</option>
              <option>FR</option>
            </select>
            <div className="hidden sm:flex items-center gap-2">
              <a href="#" className="px-4 py-2 bg-gray-900 text-white rounded-lg hover:bg-gray-800 transition-colors text-sm font-medium">
                App Store
              </a>
              <a href="#" className="px-4 py-2 bg-gray-900 text-white rounded-lg hover:bg-gray-800 transition-colors text-sm font-medium">
                Google Play
              </a>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
}
