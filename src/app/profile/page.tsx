"use client";
import { useSession } from "next-auth/react";
import React from "react";

const ProfilePage = () => {
  const { data: user } = useSession();

  console.log("user is", user);

  return (
    <div className="min-h-screen bg-gray-100 flex justify-center items-center">
      <div className="bg-white shadow-lg rounded-lg p-8 w-full max-w-md">
        <h2 className="text-2xl font-semibold mb-6 text-center text-gray-800">
          User Profile
        </h2>
        <div className="space-y-4">
          <div className="flex items-center justify-between">
            <span className="text-gray-600">Profile Image:</span>
            <img
              src={user?.user.image}
              alt="User Profile"
              className="w-16 h-16 rounded-full object-cover"
            />
          </div>
          <div className="flex items-center justify-between">
            <span className="text-gray-600">Name:</span>
            <span className="font-medium text-gray-900">{user?.user.name}</span>
          </div>
          <div className="flex items-center justify-between">
            <span className="text-gray-600">Email:</span>
            <span className="font-medium text-gray-900">
              {user?.user.email}
            </span>
          </div>
          <div className="flex items-center justify-between">
            <span className="text-gray-600">Profile Type:</span>
            <span
              className={`font-medium ${
                user?.user.isAdmin ? "text-green-600" : "text-red-600"
              }`}
            >
              {user?.user.isAdmin ? "Admin" : "User"}
            </span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProfilePage;
