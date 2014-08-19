module "relative date"

test "this year", ->
  now = moment()
  el = addTimeEl type: "date", datetime: now.toISOString()
  run()

  equal getText(el), now.format("MMM D")

test "last year", ->
  before = moment().subtract("years", 1).subtract("days", 1)
  el = addTimeEl type: "date", datetime: before.toISOString()
  run()

  equal getText(el), before.format("MMM D, YYYY")


module "relative time or date"


test "today", ->
  now = moment()
  el = addTimeEl type: "time-or-date", datetime: now.toISOString()
  run()

  equal getText(el), now.format("h:mma")

test "before today", ->
  before = moment().subtract("days", 1)
  el = addTimeEl type: "time-or-date", datetime: before.toISOString()
  run()

  equal getText(el), before.format("MMM D")


module "relative weekday"


test "today", ->
  now = moment()
  el = addTimeEl type: "weekday", datetime: now.toISOString()
  run()

  equal getText(el), "Today"

test "yesterday", ->
  yesterday = moment().subtract("days", 1)
  el = addTimeEl type: "weekday", datetime: yesterday.toISOString()
  run()

  equal getText(el), "Yesterday"

test "this week", ->
  recent = moment().subtract("days", 3)
  el = addTimeEl type: "weekday", datetime: recent.toISOString()
  run()

  equal getText(el), recent.format("dddd")

test "before this week", ->
  before = moment().subtract("days", 8)
  el = addTimeEl type: "weekday", datetime: before.toISOString()
  run()

  equal getText(el), ""


module "relative twitter"


# test "null date", ->
#   el = addTimeEl type: "twitter", datetime: null
#   run()
#
#   equal getText(el), "Just now"

test "just now", ->
  now = moment()
  el = addTimeEl type: "twitter", datetime: now.toISOString()
  run()

  equal getText(el), "Just now"

test "within minute", ->
  recent = moment().subtract("seconds", 50)
  el = addTimeEl type: "twitter", datetime: recent.toISOString()
  run()

  equal getText(el), "50s"

test "within hour", ->
  kinda_recent = moment().subtract("minutes", 48).subtract("seconds", 17)
  el = addTimeEl type: "twitter", datetime: kinda_recent.toISOString()
  run()

  equal getText(el), "48m"

test "within day", ->
  somewhat_recent = moment().subtract("hours", 14).subtract("seconds", 29)
  el = addTimeEl type: "twitter", datetime: somewhat_recent.toISOString()
  run()

  equal getText(el), "14h"

test "within 30 days", ->
  not_too_recent = moment().subtract("days", 23).subtract("hours", 8)
  el = addTimeEl type: "twitter", datetime: not_too_recent.toISOString()
  run()

  equal getText(el), "23d"

test "within 180 days", ->
  not_really_recent = moment().subtract("days", 158).subtract("hours", 3)
  el = addTimeEl type: "twitter", datetime: not_really_recent.toISOString()
  run()

  equal getText(el), not_really_recent.format("M/D")

test "more than 180 days", ->
  long_ago = moment().subtract("days", 549).subtract("hours", 3)
  el = addTimeEl type: "twitter", datetime: long_ago.toISOString()
  run()

  equal getText(el), long_ago.format("M/D/YYYY")
