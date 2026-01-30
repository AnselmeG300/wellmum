"use client";

import { Star, Play } from "lucide-react";
import Image from "next/image";

export function HeroSection() {
  return (
    <section className="relative overflow-hidden">
      <div className="max-w-[1480px] mx-auto px-4 lg:px-[120px] pb-10 lg:pb-20 pt-6 flex flex-col items-center gap-8">
        <div className="w-full bg-[#F8F8F8] rounded-[36px] border border-[#f0f0f0] overflow-hidden">
          <div className="relative flex flex-col lg:flex-row items-center gap-10 p-8 lg:py-10 lg:px-12">
            {/* Left Content */}
            <div className="flex-1 z-10">
              <div className="mb-10">
                <h1 className="font-serif font-normal text-[40px] lg:text-[70px] leading-[1.1] text-[#1d1d1d] mb-6">
                  <span className="text-[#d77f82]">Finding</span> yourself after baby, one step at a time
                </h1>
                <p className="text-[#95908e] text-base lg:text-xl font-medium leading-relaxed max-w-2xl">
                  Wellmum is more than just a program: it&apos;s a wellness app designed for mums. 
                  With tailored routines, a caring AI coach, and a supportive community, you&apos;ll 
                  make progress every day — at your own pace — to regain your strength, balance, and confidence.
                </p>
              </div>

              <div className="flex flex-col sm:flex-row gap-3">
                <button className="bg-[#7aa89b] text-white rounded-2xl text-center px-8 py-3.5 text-lg font-semibold hover:bg-[#6a9a8b] transition-colors shrink-0">
                  Start your Wellmum journey
                </button>
                <button className="bg-[#e4eeeb] text-[#7aa89b] rounded-2xl px-8 py-3.5 text-lg font-semibold flex items-center justify-center gap-3 hover:bg-[#d4dfe1] transition-colors shrink-0">
                  <div className="w-8 h-8 rounded-full border-2 border-current flex items-center justify-center bg-[#7aa89b] shrink-0">
                    <Play className="size-5 fill-[#e4eeeb] text-[#e4eeeb] ml-0.5" />
                  </div>
                  See the testimonials
                </button>
              </div>
            </div>

            {/* Right Content - Image with badges */}
            <div className="flex-1 relative w-full lg:w-auto">
              <div className="relative w-full h-[400px] lg:h-[500px]">
                {/* Main Image Placeholder */}
                <div className="absolute inset-0 bg-gradient-to-br from-pink-100 to-teal-100 rounded-3xl flex items-center justify-center">
                  <div className="flex gap-4">
                    <div className="w-32 h-64 bg-gradient-to-b from-pink-200 to-pink-300 rounded-full"></div>
                    <div className="w-32 h-64 bg-gradient-to-b from-teal-200 to-teal-300 rounded-full"></div>
                    <div className="w-32 h-64 bg-gradient-to-b from-pink-200 to-pink-300 rounded-full"></div>
                  </div>
                </div>

                {/* 24/7 Support Badge */}
                <div className="absolute bottom-8 left-4 bg-white/90 backdrop-blur-md border border-gray-200/50 rounded-2xl px-4 py-3 shadow-lg">
                  <div className="flex items-center gap-3">
                    <div className="text-[#8b6ab6] text-3xl font-bold">24/7</div>
                    <div className="text-sm">
                      <div className="font-medium text-[#1d1d1d]">Support</div>
                      <div className="text-[#95908e]">AI Coach</div>
                    </div>
                  </div>
                </div>

                {/* 12 Weeks Badge */}
                <div className="absolute top-44 right-4 bg-white/90 backdrop-blur-md border border-gray-200/50 rounded-2xl px-4 py-3 shadow-lg">
                  <div className="flex items-center gap-3">
                    <div className="text-[#4aa3b5] text-3xl font-bold">12</div>
                    <div className="text-sm">
                      <div className="font-medium text-[#1d1d1d]">Weeks</div>
                      <div className="text-[#95908e]">Programme</div>
                    </div>
                  </div>
                </div>

                {/* 5 Stars Badge */}
                <div className="inline-flex items-center gap-3 bg-white/80 backdrop-blur-md border border-white/90 rounded-full px-4 py-2.5 shadow-sm absolute top-0 right-0">
                  <div className="flex items-center gap-1.5">
                    {[...Array(5)].map((_, i) => (
                      <Star
                        key={i}
                        className="w-[18px] h-[18px] text-yellow-300 fill-yellow-300 -ml-1 first:ml-0"
                      />
                    ))}
                  </div>
                  <span className="text-[#3e3e3e] text-sm lg:text-base">
                    Recommended by{" "}
                    <span className="font-semibold text-[#d77f82]">500+</span> mums
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
