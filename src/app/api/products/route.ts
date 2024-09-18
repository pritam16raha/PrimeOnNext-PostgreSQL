import { prisma } from "@/utils/connect";
import { Prisma } from "@prisma/client";
import { NextRequest, NextResponse } from "next/server";



// FETCH ALL PRODUCTS
export const GET = async (req: NextRequest) => {
  const { searchParams } = new URL(req.url);
  const cat = searchParams.get("cat");

  try {
    const products = await prisma.product.findMany({
      where: {
        ...(cat ? { catSlug: cat } : { isFeatured: true }),
      },
    });
    return new NextResponse(JSON.stringify(products), { status: 200 });
  } catch (err) {
    console.log(err);
    return new NextResponse(
      JSON.stringify({ message: "Something went wrong!" }),
      { status: 500 }
    );
  }
};

// export const POST = async (req: NextRequest) => {
//   try {
//     const body = await req.json();

//     // Check if the category slug exists in the Category table
//     const category = await prisma.category.findUnique({
//       where: { slug: body.catSlug },
//     });

//     // If the category does not exist, throw an error
//     if (!category) {
//       return new NextResponse(
//         JSON.stringify({
//           message: `Category with slug ${body.catSlug} does not exist.`,
//         }),
//         { status: 400 }
//       );
//     }

//     // If category exists, create the product
//     const product = await prisma.product.create({
//       data: {
//         title: body.title,
//         desc: body.desc,
//         price: new Prisma.Decimal(body.price),
//         options: body.options, // Already an array, no need to wrap it in JSON.parse or similar
//         category: { connect: { slug: body.catSlug } },
//       },
//     });

//     return new NextResponse(JSON.stringify(product), { status: 201 });
//   } catch (err) {
//     console.log(err);
//     return new NextResponse(
//       JSON.stringify({ message: "Something went wrong!" }),
//       { status: 500 }
//     );
//   }
// };



// export const POST = async (req: NextRequest) => {
//   try {
//     const body = await req.json();

//     // Check if the category already exists by its slug
//     const existingCategory = await prisma.category.findUnique({
//       where: { slug: body.slug },
//     });

//     if (existingCategory) {
//       return new NextResponse(
//         JSON.stringify({
//           message: `Category with slug '${body.slug}' already exists.`,
//         }),
//         { status: 400 }
//       );
//     }

//     // Create new category
//     const newCategory = await prisma.category.create({
//       data: {
//         title: body.title,
//         desc: body.desc,
//         slug: body.slug, // Ensure that the slug is unique
//         type: body.type || "",
//         img: body.img || "", // Optional image
//       },
//     });

//     return new NextResponse(JSON.stringify(newCategory), { status: 201 });
//   } catch (err) {
//     console.log(err);
//     return new NextResponse(
//       JSON.stringify({ message: "Error in creating category" }),
//       { status: 500 }
//     );
//   }
// };

export const POST = async (req: NextRequest) => {
  try {
    const body = await req.json();

    // Check if the category slug exists in the Category table
    let category = await prisma.category.findUnique({
      where: { slug: body.catSlug },
    });

    // If the category does not exist, create a new category
    if (!category) {
      category = await prisma.category.create({
        data: {
          title: "Default Title", // Provide a default title
          desc: "Default Description", // Provide a default description
          slug: body.catSlug,
          type: "default-type", // Provide a default type
          img: "default-image-url", // Provide a default image
        },
      });
    }

    // Create the product
    const product = await prisma.product.create({
      data: {
        title: body.title,
        desc: body.desc,
        price: new Prisma.Decimal(body.price),
        options: body.options, // Already an array, no need to wrap it in JSON.parse or similar
        category: { connect: { slug: body.catSlug } },
        img: body.img
      },
    });

    return new NextResponse(JSON.stringify(product), { status: 201 });
  } catch (err) {
    console.log(err);
    return new NextResponse(
      JSON.stringify({ message: "Something went wrong!" }),
      { status: 500 }
    );
  }
};

