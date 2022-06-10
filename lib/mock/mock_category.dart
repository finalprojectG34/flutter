var mockCategory = {
  "getAllItems": [
    {
      "name": "item 1",
      "price": {
        "discountPrice": 10000,
        "sale": 12000,
      },
      "description":
          "cnjkfcn fnviunv fviudv dfvudbvd fkvdkbv dfvkdfv dfkv dfvkhdf vdkfvbdfouvb dfk",
      "attrs": [
        {
          "name": "condition",
          "val": "brand new",
        }
      ],
      "poster":
          "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"
    },
    {
      "name": "item 2",
      "price": {
        "discountPrice": 452,
        "sale": 600,
      },
      "description":
          "111wnc dfkjvdfivdf vifdbvoidfv dfo fnviunv fviudv dfvudbvd fkvdkbv dfvkdfv dfkv dfvkhdf vdkfvbdfouvb dfk",
      "attrs": [
        {
          "name": "condition",
          "val": "used",
        }
      ],
      "poster":
          "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"
    },
    {
      "name": "item 3",
      "price": {
        // "discountPrice": 10000,
        "sale": 800,
      },
      "description":
          "86095nfgiuvhnfgb gfib bifb cnjkfcn fnviunv fviudv dfvudbvd fkvdkbv dfvkdfv dfkv dfvkhdf vdkfvbdfouvb dfk",
      "attrs": [
        {
          "name": "condition",
          "val": "brand new",
        }
      ],
      "poster":
          "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"
    }
  ]
};

var mockAllCategories =  [
  {
    "id": "612e17f2443a71e64c66c7aa",
    "name": "electronics",
    "attributes": [
      {
        "slug": "condition",
        "name": "condition",
        "display": "dropdown",
        "categoryIds": [
          "612e17f2443a71e64c66c7aa",
          "612e17f2443a71e64c66c7bb",
          "612e17f2443a71e64c66c7cc"
        ],
        "isRequired": true,
        "options": ["new", "used", "almost new", "used abroad"],
        "currentData": [
          {"value": "new", "count": 20},
          {"value": "used", "count": 25},
        ]
      },
    ],
    "count": 50,
    "slug": "electronics",
    "isCreatable": true,
    "hasSubcategory": true,
    "subCategories": [
      {
        "name": "computers and laptops",
        "id": "612e17f2443a71e64c66c7bb",
        "isCreatable": true,
        "hasSubcategory": true,
        "subCategories": [
          {
            "name": "dell",
            "id": "612e17f2443a71e64c66c7bx",
            "isCreatable": true,
            "hasSubcategory": true,
            "subCategories": [
              {
                "name": "dell type 1",
                "id": "612e17f2443a71e64c66c7bx",
                "isCreatable": true,
                "hasSubcategory": false,
                "subCategories": [],
                "attributes": [
                  {
                    "slug": "ram",
                    "name": "ram",
                    "categoryIds": ["612e17f2443a71e64c66c7bb"],
                    "display": "number",
                    "isRequired": true,
                    "options": ["4", "6", "12", "16", "32"],
                    "currentData": [
                      {
                        "value": "4",
                        "count": 15,
                      },
                      {
                        "value": "8",
                        "count": 20,
                      },
                    ],
                    "subAttributes": [
                      {
                        "name": "ram type",
                        "options": ["ddr3", "ddr4"]
                      }
                    ]
                  },
                  {
                    "slug": "internal-hard-disk",
                    "name": "internal hard disk",
                    "display": "number",
                    "categoryIds": ["612e17f2443a71e64c66c7bb"],
                    "isRequired": true,
                    "options": [
                      "8",
                      "16",
                      "32",
                      "64",
                      "128",
                      "256",
                      "500"
                    ],
                    "currentData": [
                      {"value": "128", "count": 15},
                      {"value": "256", "count": 29},
                      {"value": "500", "count": 60},
                    ],
                    "modifiers": ["ssd sata", "hdd", "ssd nvme"],
                  },
                  {
                    "slug": "color",
                    "name": "color",
                    "display": "text",
                    "categoryIds": [
                      "612e17f2443a71e64c66c7cc",
                      "612e17f2443a71e64c66c7bb"
                    ],
                    "isRequired": false,
                    "options": ["red", "blue", "black"],
                    "currentData": [
                      {"value": "blue", "count": 15},
                      {"value": "black", "count": 25},
                    ]
                  },
                  {
                    "slug": "condition",
                    "name": "condition",
                    "display": "dropdown",
                    "categoryIds": [
                      "612e17f2443a71e64c66c7aa",
                      "612e17f2443a71e64c66c7bb",
                      "612e17f2443a71e64c66c7cc"
                    ],
                    "isRequired": true,
                    "options": [
                      "new",
                      "used",
                      "almost new",
                      "used abroad"
                    ],
                    "currentData": [
                      {"value": "new", "count": 20},
                      {"value": "used", "count": 25},
                    ]
                  },
                ],
                "ancestors": ["612e17f2443a71e64c66c7aa"],
                "count": 3,
                "slug": "mobile-phones",
                "parentId": "612e17f2443a71e64c66c7aa",
                "image": "default.png",
              },
              {
                "name": "dell type 2",
                "id": "612e17f2443a71e64c66c7bx",
                "isCreatable": true,
                "hasSubcategory": false,
                "subCategories": [],
                "attributes": [
                  {
                    "slug": "ram",
                    "name": "ram",
                    "categoryIds": ["612e17f2443a71e64c66c7bb"],
                    "display": "",
                    "isRequired": true,
                    "options": ["4", "6", "12", "16", "32"],
                    "currentData": [
                      {
                        "value": "4",
                        "count": 15,
                      },
                      {
                        "value": "8",
                        "count": 20,
                      },
                    ],
                    "subAttributes": [
                      {
                        "name": "ram type",
                        "options": ["ddr3", "ddr4"]
                      }
                    ]
                  },
                  {
                    "slug": "internal-hard-disk",
                    "name": "internal hard disk",
                    "categoryIds": ["612e17f2443a71e64c66c7bb"],
                    "isRequired": true,
                    "options": [
                      "8",
                      "16",
                      "32",
                      "64",
                      "128",
                      "256",
                      "500"
                    ],
                    "currentData": [
                      {"value": "128", "count": 15},
                      {"value": "256", "count": 29},
                      {"value": "500", "count": 60},
                    ],
                    "display": "ComboBox",
                    "modifiers": ["ssd sata", "hdd", "ssd nvme"],
                  },
                  {
                    "slug": "color",
                    "name": "color",
                    "categoryIds": [
                      "612e17f2443a71e64c66c7cc",
                      "612e17f2443a71e64c66c7bb"
                    ],
                    "isRequired": false,
                    "options": ["red", "blue", "black"],
                    "currentData": [
                      {"value": "blue", "count": 15},
                      {"value": "black", "count": 25},
                    ]
                  },
                  {
                    "slug": "condition",
                    "name": "condition",
                    "categoryIds": [
                      "612e17f2443a71e64c66c7aa",
                      "612e17f2443a71e64c66c7bb",
                      "612e17f2443a71e64c66c7cc"
                    ],
                    "isRequired": true,
                    "options": [
                      "new",
                      "used",
                      "almost new",
                      "used abroad"
                    ],
                    "currentData": [
                      {"value": "new", "count": 20},
                      {"value": "used", "count": 25},
                    ]
                  },
                ],
                "ancestors": ["612e17f2443a71e64c66c7aa"],
                "count": 3,
                "slug": "mobile-phones",
                "parentId": "612e17f2443a71e64c66c7aa",
                "image": "default.png",
              },
            ],
            "attributes": [
              {
                "slug": "ram",
                "name": "ram",
                "display": "number",
                "categoryIds": ["612e17f2443a71e64c66c7bb"],
                "isRequired": true,
                "options": ["4", "6", "12", "16", "32"],
                "currentData": [
                  {
                    "value": "4",
                    "count": 15,
                  },
                  {
                    "value": "8",
                    "count": 20,
                  },
                ],
                "subAttributes": [
                  {
                    "name": "ram type",
                    "options": ["ddr3", "ddr4"]
                  }
                ]
              },
              {
                "slug": "internal-hard-disk",
                "name": "internal hard disk",
                "display": "number",
                "categoryIds": ["612e17f2443a71e64c66c7bb"],
                "isRequired": true,
                "options": [
                  "8",
                  "16",
                  "32",
                  "64",
                  "128",
                  "256",
                  "500"
                ],
                "currentData": [
                  {"value": "128", "count": 15},
                  {"value": "256", "count": 29},
                  {"value": "500", "count": 60},
                ],
                "modifiers": ["ssd sata", "hdd", "ssd nvme"],
              },
              {
                "slug": "color",
                "name": "color",
                "display": "text",
                "categoryIds": [
                  "612e17f2443a71e64c66c7cc",
                  "612e17f2443a71e64c66c7bb"
                ],
                "isRequired": false,
                "options": ["red", "blue", "black"],
                "currentData": [
                  {"value": "blue", "count": 15},
                  {"value": "black", "count": 25},
                ]
              },
              {
                "slug": "condition",
                "name": "condition",
                "display": "dropdown",
                "categoryIds": [
                  "612e17f2443a71e64c66c7aa",
                  "612e17f2443a71e64c66c7bb",
                  "612e17f2443a71e64c66c7cc"
                ],
                "isRequired": true,
                "options": [
                  "new",
                  "used",
                  "almost new",
                  "used abroad"
                ],
                "currentData": [
                  {"value": "new", "count": 20},
                  {"value": "used", "count": 25},
                ]
              },
            ],
            "ancestors": ["612e17f2443a71e64c66c7aa"],
            "count": 3,
            "slug": "mobile-phones",
            "parentId": "612e17f2443a71e64c66c7aa",
            "image": "default.png",
          },
          {
            "name": "hp",
            "id": "612e17f2443a71e64c66c7bs",
            "isCreatable": true,
            "hasSubcategory": false,
            "subCategories": [],
            "attributes": [
              {
                "slug": "ram",
                "name": "ram",
                "display": "number",
                "categoryIds": ["612e17f2443a71e64c66c7bb"],
                "isRequired": true,
                "options": ["4", "6", "12", "16", "32"],
                "currentData": [
                  {
                    "value": "4",
                    "count": 15,
                  },
                  {
                    "value": "8",
                    "count": 20,
                  },
                ],
                "subAttributes": [
                  {
                    "name": "ram type",
                    "options": ["ddr3", "ddr4"]
                  }
                ]
              },
              {
                "slug": "internal-hard-disk",
                "name": "internal hard disk",
                "display": "number",
                "categoryIds": ["612e17f2443a71e64c66c7bb"],
                "isRequired": true,
                "options": [
                  "8",
                  "16",
                  "32",
                  "64",
                  "128",
                  "256",
                  "500"
                ],
                "currentData": [
                  {"value": "128", "count": 15},
                  {"value": "256", "count": 29},
                  {"value": "500", "count": 60},
                ],
                "modifiers": ["ssd sata", "hdd", "ssd nvme"],
              },
              {
                "slug": "color",
                "name": "color",
                "display": "text",
                "categoryIds": [
                  "612e17f2443a71e64c66c7cc",
                  "612e17f2443a71e64c66c7bb"
                ],
                "isRequired": false,
                "options": ["red", "blue", "black"],
                "currentData": [
                  {"value": "blue", "count": 15},
                  {"value": "black", "count": 25},
                ]
              },
              {
                "slug": "condition",
                "name": "condition",
                "display": "dropdown",
                "categoryIds": [
                  "612e17f2443a71e64c66c7aa",
                  "612e17f2443a71e64c66c7bb",
                  "612e17f2443a71e64c66c7cc"
                ],
                "isRequired": true,
                "options": [
                  "new",
                  "used",
                  "almost new",
                  "used abroad"
                ],
                "currentData": [
                  {"value": "new", "count": 20},
                  {"value": "used", "count": 25},
                ]
              },
            ],
            "ancestors": ["612e17f2443a71e64c66c7aa"],
            "count": 3,
            "slug": "mobile-phones",
            "parentId": "612e17f2443a71e64c66c7aa",
            "image": "default.png",
          }
        ],
        "attributes": [
          {
            "slug": "ram",
            "name": "ram",
            "display": "number",
            "categoryIds": ["612e17f2443a71e64c66c7bb"],
            "isRequired": true,
            "options": ["4", "6", "12", "16", "32"],
            "currentData": [
              {
                "value": "4",
                "count": 15,
              },
              {
                "value": "8",
                "count": 20,
              },
            ],
            "subAttributes": [
              {
                "name": "ram type",
                "options": ["ddr3", "ddr4"]
              }
            ]
          },
          {
            "slug": "internal-hard-disk",
            "name": "internal hard disk",
            "display": "number",
            "categoryIds": ["612e17f2443a71e64c66c7bb"],
            "isRequired": true,
            "options": [
              "8",
              "16",
              "32",
              "64",
              "128",
              "256",
              "500"
            ],
            "currentData": [
              {"value": "128", "count": 15},
              {"value": "256", "count": 29},
              {"value": "500", "count": 60},
            ],
            "modifiers": ["ssd sata", "hdd", "ssd nvme"],
          },
          {
            "slug": "color",
            "name": "color",
            "display": "text",
            "categoryIds": [
              "612e17f2443a71e64c66c7cc",
              "612e17f2443a71e64c66c7bb"
            ],
            "isRequired": false,
            "options": ["red", "blue", "black"],
            "currentData": [
              {"value": "blue", "count": 15},
              {"value": "black", "count": 25},
            ]
          },
          {
            "slug": "condition",
            "name": "condition",
            "display": "dropdown",
            "categoryIds": [
              "612e17f2443a71e64c66c7aa",
              "612e17f2443a71e64c66c7bb",
              "612e17f2443a71e64c66c7cc"
            ],
            "isRequired": true,
            "options": [
              "new",
              "used",
              "almost new",
              "used abroad"
            ],
            "currentData": [
              {"value": "new", "count": 20},
              {"value": "used", "count": 25},
            ]
          },
        ],
        "ancestors": ["612e17f2443a71e64c66c7aa"],
        "count": 3,
        "slug": "mobile-phones",
        "parentId": "612e17f2443a71e64c66c7aa",
        "image": "default.png",
      },
      {
        "name": "computers and laptops 2",
        "id": "612e17f2443a71e64c66c7bbf",
        "isCreatable": true,
        "hasSubcategory": false,
        "subCategories": [],
        "attributes": [
          {
            "slug": "ram",
            "name": "ram",
            "display": "number",
            "categoryIds": ["612e17f2443a71e64c66c7bb"],
            "isRequired": true,
            "options": ["4", "6", "12", "16", "32"],
            "currentData": [
              {
                "value": "4",
                "count": 15,
              },
              {
                "value": "8",
                "count": 20,
              },
            ],
            "subAttributes": [
              {
                "name": "ram type",
                "options": ["ddr3", "ddr4"]
              }
            ]
          },
          {
            "slug": "internal-hard-disk",
            "name": "internal hard disk",
            "display": "number",
            "categoryIds": ["612e17f2443a71e64c66c7bb"],
            "isRequired": true,
            "options": [
              "8",
              "16",
              "32",
              "64",
              "128",
              "256",
              "500"
            ],
            "currentData": [
              {"value": "128", "count": 15},
              {"value": "256", "count": 29},
              {"value": "500", "count": 60},
            ],
            "modifiers": ["ssd sata", "hdd", "ssd nvme"],
          },
          {
            "slug": "color",
            "name": "color",
            "display": "text",
            "categoryIds": [
              "612e17f2443a71e64c66c7cc",
              "612e17f2443a71e64c66c7bb"
            ],
            "isRequired": false,
            "options": ["red", "blue", "black"],
            "currentData": [
              {"value": "blue", "count": 15},
              {"value": "black", "count": 25},
            ]
          },
          {
            "slug": "condition",
            "name": "condition",
            "display": "dropdown",
            "categoryIds": [
              "612e17f2443a71e64c66c7aa",
              "612e17f2443a71e64c66c7bb",
              "612e17f2443a71e64c66c7cc"
            ],
            "isRequired": true,
            "options": [
              "new",
              "used",
              "almost new",
              "used abroad"
            ],
            "currentData": [
              {"value": "new", "count": 20},
              {"value": "used", "count": 25},
            ]
          },
        ],
        "ancestors": ["612e17f2443a71e64c66c7aa"],
        "count": 3,
        "slug": "mobile-phones",
        "parentId": "612e17f2443a71e64c66c7aa",
        "image": "default.png",
      },
    ],
    "parentId": "",
    "image": "default.png",
    "description": "this is a description"
  },
];
