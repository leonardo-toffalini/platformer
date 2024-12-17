return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 20,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 7,
  nextobjectid = 17,
  properties = {},
  tilesets = {
    {
      name = "minimalist",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "../assets/mininicular.png",
      imagewidth = 128,
      imageheight = 128,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 64,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 2,
      name = "background",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        58, 59, 59, 59, 59, 59, 59, 60, 58, 60, 58, 59, 59, 59, 59, 59, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 59, 59, 60, 58, 60, 58, 59, 59, 59, 59, 59, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 59, 59, 60, 58, 60, 58, 59, 59, 59, 59, 59, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 61, 59, 59, 59, 60, 58, 60, 58, 59, 59, 59, 61, 59, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 62, 59, 59, 59, 60, 58, 60, 58, 59, 59, 59, 62, 59, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 62, 59, 59, 59, 60, 58, 60, 58, 59, 59, 61, 62, 59, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 62, 59, 59, 59, 60, 58, 60, 58, 59, 59, 62, 62, 59, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 62, 59, 59, 59, 60, 58, 60, 58, 59, 59, 62, 63, 59, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 62, 59, 59, 59, 60, 58, 60, 58, 59, 59, 64, 59, 59, 59, 61, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 63, 59, 59, 59, 60, 58, 60, 58, 59, 59, 64, 59, 59, 59, 64, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 61, 59, 60, 58, 60, 58, 59, 59, 62, 59, 59, 59, 64, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 62, 59, 60, 58, 60, 58, 59, 59, 62, 59, 59, 59, 62, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 62, 59, 60, 58, 60, 58, 59, 59, 63, 61, 59, 59, 62, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 62, 59, 60, 58, 60, 58, 59, 59, 59, 62, 59, 59, 62, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 62, 59, 60, 58, 60, 58, 59, 59, 59, 62, 61, 59, 62, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 63, 59, 60, 58, 60, 58, 59, 59, 59, 63, 62, 59, 63, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 59, 59, 60, 58, 60, 58, 59, 59, 59, 59, 62, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 59, 59, 60, 58, 60, 58, 59, 59, 59, 59, 62, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 59, 59, 60, 58, 60, 58, 59, 59, 59, 59, 63, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59,
        58, 59, 59, 59, 59, 59, 59, 60, 58, 60, 58, 59, 59, 59, 59, 59, 59, 59, 60, 57, 57, 58, 59, 59, 59, 60, 58, 60, 58, 59
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 4,
      name = "2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        55, 48, 56, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 5, 22, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 5, 5, 39, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 55, 48, 48, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 5, 5, 22, 39, 2, 2, 2, 2, 2, 2, 55, 55, 2, 15, 5, 5, 5, 14, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 5, 5, 5, 22, 39, 55, 55, 48, 2, 21, 5, 5, 5, 5, 5, 24, 53, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 24, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0,
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 24, 2, 53, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 55, 48, 48, 55, 55,
        5, 5, 5, 5, 5, 5, 5, 5, 5, 54, 54, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 21, 8, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 5, 5, 5, 54, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 37, 5, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 5, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 5, 5, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 15, 5, 5, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 29, 5, 5, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 40, 5, 5, 5, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 5, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 21, 5, 5, 5, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 5, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 45, 5, 5, 5, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 5, 5, 16, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 29, 5, 5, 5, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 5, 5, 5, 39, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 40, 5, 5, 5, 5, 5, 5, 5, 5, 5
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 1,
      name = "foreground",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2, 2, 2, 2, 2, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0,
        0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0,
        0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0,
        0, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 51, 52,
        51, 51, 0, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 44, 2, 51, 2, 2, 2, 0, 0, 0, 9, 1, 1,
        1, 1, 18, 0, 2, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9, 4, 4, 4, 10, 2, 2, 2, 0, 0, 2, 28, 33,
        1, 1, 42, 0, 0, 0, 2, 44, 2, 51, 0, 2, 2, 2, 2, 2, 2, 2, 50, 50, 50, 27, 2, 2, 2, 0, 0, 0, 0, 41,
        1, 1, 34, 0, 0, 0, 9, 4, 4, 4, 10, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 25,
        1, 1, 34, 0, 0, 0, 28, 50, 50, 50, 27, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 19,
        1, 1, 1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 18, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 12, 51, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
