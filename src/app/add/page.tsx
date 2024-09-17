"use client";

import { useSession } from "next-auth/react";
import Image from "next/image";
import { useRouter } from "next/navigation";
import React, { useState } from "react";

type Inputs = {
  title: string;
  desc: string;
  price: number;
  catSlug: string;
};

type Option = {
  title: string;
  additionalPrice: number;
};

const AddPage = () => {
  const { data: session, status } = useSession();
  const [inputs, setInputs] = useState<Inputs>({
    title: "",
    desc: "",
    price: 0,
    catSlug: "",
  });

  const [option, setOption] = useState<Option>({
    title: "",
    additionalPrice: 0,
  });

  const [options, setOptions] = useState<Option[]>([]);

  const router = useRouter();
  if (status === "loading") {
    return <p> Loading.... </p>;
  }

  if (status === "unauthenticated" || !session?.user.isAdmin) {
    router.push("/");
  }

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>
  ) => {
    setInputs((prev) => {
      return { ...prev, [e.target.name]: e.target.value };
    });
  };

  const changeOption = (e: React.ChangeEvent<HTMLInputElement>) => {
    setOption((prev) => {
      return { ...prev, [e.target.name]: e.target.value };
    });
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    try {
      const res = await fetch("http://localhost:3000/api/products", {
        method: "POST",
        body: JSON.stringify({
          ...inputs,
          options,
        }),
      });
      const data = await res.json();
      // router.push(`/product/${data.id}`);

    } catch (err) {
      console.log(err);
    }
  };

  return (
    <div>
      <form
        className="shadow-lg flex flex-wrap gap-4 p-8"
        onSubmit={handleSubmit}
      >
        <h1>Add Product Product</h1>
        <div>
          <label>Title</label>
          <input
            onChange={handleChange}
            name="title"
            type="text"
            className="ring-1 ring-red-200 p-2 rounded-sm"
          />
        </div>
        <div className="w-full flex flex-col gap-2">
          <label>Description</label>
          <textarea
            name="desc"
            rows={3}
            className="ring-1 ring-red-200 p-2 rounded-sm"
            onChange={handleChange}
          />
        </div>
        <div className="w-full flex flex-col gap-2">
          <label>Price</label>
          <input
            onChange={handleChange}
            name="price"
            type="number"
            className="ring-1 ring-red-200 p-2 rounded-sm"
          />
        </div>
        <div className="w-full flex flex-col gap-2">
          <label>Category</label>
          <input
            onChange={handleChange}
            name="catSlug"
            type="text"
            className="ring-1 ring-red-200 p-2 rounded-sm"
          />
        </div>
        <div className="w-full flex flex-col gap-2">
          <label>Options</label>
          <div>
            <input
              onChange={changeOption}
              type="text"
              placeholder="Title"
              name="title"
              className="ring-1 ring-red-200 p-2 rounded-sm"
            />
            <input
              onChange={changeOption}
              type="number"
              placeholder="Additional Price"
              name="additionalPrice"
              className="ring-1 ring-red-200 p-2 rounded-sm"
            />
          </div>
          <div
            className="w-40 bg-red-500 text-white p-2"
            onClick={() => setOptions((prev) => [...prev, option])}
          >
            Add Option
          </div>
        </div>
        <div>
          {options.map((opt) => (
            <div
              className="ring-1 p-2 ring-red-500 rounded-md cursor-pointer"
              onClick={() =>
                setOptions((prev) =>
                  prev.filter((item) => item.title !== opt.title)
                )
              }
              key={opt.title}
            >
              <span>{opt.title}</span>
              <span>{opt.additionalPrice}</span>
            </div>
          ))}
        </div>
        <button type="submit" className="w-full p-2 bg-red-500 text-white">
          Submit
        </button>
      </form>
    </div>
  );
};

export default AddPage;
