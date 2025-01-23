const jsonString = '''
    {
  "pets": [
    {
      "id": "1",
      "name": "Buddy",
      "age": 2,
      "price": 100,
      "breed": "Golden Retriever",
      "imageUrl": [
        "https://example.com/buddy1.jpg",
        "https://example.com/buddy2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "2",
      "name": "Max",
      "age": 3,
      "price": 150,
      "breed": "German Shepherd",
      "imageUrl": [
        "https://example.com/max1.jpg",
        "https://example.com/max2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "3",
      "name": "Bella",
      "age": 1,
      "price": 120,
      "breed": "Bulldog",
      "imageUrl": [
        "https://example.com/bella1.jpg",
        "https://example.com/bella2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "4",
      "name": "Charlie",
      "age": 4,
      "price": 200,
      "breed": "Poodle",
      "imageUrl": [
        "https://example.com/charlie1.jpg",
        "https://example.com/charlie2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "5",
      "name": "Lucy",
      "age": 2,
      "price": 90,
      "breed": "Beagle",
      "imageUrl": [
        "https://example.com/lucy1.jpg",
        "https://example.com/lucy2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "6",
      "name": "Daisy",
      "age": 5,
      "price": 180,
      "breed": "Siberian Husky",
      "imageUrl": [
        "https://example.com/daisy1.jpg",
        "https://example.com/daisy2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "7",
      "name": "Rocky",
      "age": 3,
      "price": 130,
      "breed": "Boxer",
      "imageUrl": [
        "https://example.com/rocky1.jpg",
        "https://example.com/rocky2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "8",
      "name": "Molly",
      "age": 2,
      "price": 110,
      "breed": "Dachshund",
      "imageUrl": [
        "https://example.com/molly1.jpg",
        "https://example.com/molly2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "9",
      "name": "Bailey",
      "age": 4,
      "price": 160,
      "breed": "Shih Tzu",
      "imageUrl": [
        "https://example.com/bailey1.jpg",
        "https://example.com/bailey2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "10",
      "name": "Lola",
      "age": 1,
      "price": 95,
      "breed": "Chihuahua",
      "imageUrl": [
        "https://example.com/lola1.jpg",
        "https://example.com/lola2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "11",
      "name": "Cooper",
      "age": 3,
      "price": 140,
      "breed": "Rottweiler",
      "imageUrl": [
        "https://example.com/cooper1.jpg",
        "https://example.com/cooper2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "12",
      "name": "Sadie",
      "age": 2,
      "price": 100,
      "breed": "Great Dane",
      "imageUrl": [
        "https://example.com/sadie1.jpg",
        "https://example.com/sadie2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "13",
      "name": "Toby",
      "age": 4,
      "price": 170,
      "breed": "Pomeranian",
      "imageUrl": [
        "https://example.com/toby1.jpg",
        "https://example.com/toby2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "14",
      "name": "Zoe",
      "age": 1,
      "price": 85,
      "breed": "Yorkshire Terrier",
      "imageUrl": [
        "https://example.com/zoe1.jpg",
        "https://example.com/zoe2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "15",
      "name": "Duke",
      "age": 3,
      "price": 150,
      "breed": "Labrador Retriever",
      "imageUrl": [
        "https://example.com/duke1.jpg",
        "https://example.com/duke2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "16",
      "name": "Luna",
      "age": 2,
      "price": 120,
      "breed": "French Bulldog",
      "imageUrl": [
        "https://example.com/luna1.jpg",
        "https://example.com/luna2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "17",
      "name": "Jack",
      "age": 4,
      "price": 190,
      "breed": "Cocker Spaniel",
      "imageUrl": [
        "https://example.com/jack1.jpg",
        "https://example.com/jack2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "18",
      "name": "Mia",
      "age": 1,
      "price": 90,
      "breed": "Pug",
      "imageUrl": [
        "https://example.com/mia1.jpg",
        "https://example.com/mia2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "19",
      "name": "Bear",
      "age": 3,
      "price": 130,
      "breed": "Saint Bernard",
      "imageUrl": [
        "https://example.com/bear1.jpg",
        "https://example.com/bear2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "20",
      "name": "Ruby",
      "age": 2,
      "price": 110,
      "breed": "Border Collie",
      "imageUrl": [
        "https://example.com/ruby1.jpg",
        "https://example.com/ruby2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "21",
      "name": "Oscar",
      "age": 4,
      "price": 160,
      "breed": "Bull Terrier",
      "imageUrl": [
        "https://example.com/oscar1.jpg",
        "https://example.com/oscar2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "22",
      "name": "Coco",
      "age": 1,
      "price": 95,
      "breed": "Maltese",
      "imageUrl": [
        "https://example.com/coco1.jpg",
        "https://example.com/coco2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "23",
      "name": "Roxy",
      "age": 2,
      "price": 120,
      "breed": "Siamese Cat",
      "imageUrl": [
        "https://example.com/roxy1.jpg",
        "https://example.com/roxy2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "24",
      "name": "Milo",
      "age": 3,
      "price": 140,
      "breed": "Persian Cat",
      "imageUrl": [
        "https://example.com/milo1.jpg",
        "https://example.com/milo2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "25",
      "name": "Lily",
      "age": 1,
      "price": 80,
      "breed": "Bengal Cat",
      "imageUrl": [
        "https://example.com/lily1.jpg",
        "https://example.com/lily2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "26",
      "name": "Blue",
      "age": 2,
      "price": 100,
      "breed": "Parrot",
      "imageUrl": [
        "https://example.com/blue1.jpg",
        "https://example.com/blue2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "27",
      "name": "Sky",
      "age": 1,
      "price": 90,
      "breed": "Cockatiel",
      "imageUrl": [
        "https://example.com/sky1.jpg",
        "https://example.com/sky2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "28",
      "name": "Snowball",
      "age": 2,
      "price": 110,
      "breed": "Rabbit",
      "imageUrl": [
        "https://example.com/snowball1.jpg",
        "https://example.com/snowball2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "29",
      "name": "Cotton",
      "age": 1,
      "price": 85,
      "breed": "Rabbit",
      "imageUrl": [
        "https://example.com/cotton1.jpg",
        "https://example.com/cotton2.jpg"
      ],
      "isAdopted": false
    },
    {
      "id": "30",
      "name": "Thumper",
      "age": 3,
      "price": 120,
      "breed": "Rabbit",
      "imageUrl": [
        "https://example.com/thumper1.jpg",
        "https://example.com/thumper2.jpg"
      ],
      "isAdopted": false
    }
  ]
}
    ''';