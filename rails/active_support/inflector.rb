include ActiveSupport::Inflector            # some helpers for inflection (examiniing state of program at run time)

"playlist_policy".classify                  # => "PlaylistPolicy"
"PlaylistPolicy".constantize                # => PlaylistPolicy - use this to resolve a string to an actual class name (constant)