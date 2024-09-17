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

export const POST = async (req: NextRequest) => {
  try {
    const body = await req.json();

    // Check if the category slug exists in the Category table
    const category = await prisma.category.findUnique({
      where: { slug: body.catSlug },
    });

    // If the category does not exist, throw an error
    if (!category) {
      return new NextResponse(
        JSON.stringify({
          message: `Category with slug ${body.catSlug} does not exist.`,
        }),
        { status: 400 }
      );
    }

    // If category exists, create the product
    const product = await prisma.product.create({
      data: {
        title: body.title,
        desc: body.desc,
        price: new Prisma.Decimal(body.price),
        options: body.options, // Already an array, no need to wrap it in JSON.parse or similar
        category: { connect: { slug: body.catSlug } },
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
