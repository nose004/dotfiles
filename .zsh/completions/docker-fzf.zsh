#! /usr/bin/zsh

export DOCKER_FZF_PREFIX="--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"

_fzf_complete_docker_image_post() {
  awk '{ if ($1=="<none>") print $3; else print $1":"$2 }'
}

_fzf_complete_docker_image () {
    _fzf_complete "$DOCKER_FZF_PREFIX -m --header-lines=1" "$@" < <(
        docker images
    )
}

_fzf_complete_docker_container_post() {
    awk '{print $NF}'
}

_fzf_complete_docker_container () {
    _fzf_complete "$DOCKER_FZF_PREFIX -m --header-lines=1" "$@" < <(
        docker ps -a
    )
}

_fzf_complete_docker_container_running_post() {
    awk '{print $NF}'
}

_fzf_complete_docker_container_running () {
    _fzf_complete "$DOCKER_FZF_PREFIX -m --header-lines=1" "$@" < <(
        docker ps
    )
}

_fzf_complete_docker_container_stopped_post() {
    awk '{print $NF}'
}

_fzf_complete_docker_container_stopped () {
    _fzf_complete "$DOCKER_FZF_PREFIX -m --header-lines=1" "$@" < <(
        docker ps --filter "status=exited" --filter="status=created"
    )
}

_fzf_complete_docker() {
    local tokens docker_command
    setopt localoptions noshwordsplit noksh_arrays noposixbuiltins
    # http://zsh.sourceforge.net/FAQ/zshfaq03.html
    # http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags
    tokens=(${(z)LBUFFER})
    if [ ${#tokens} -le 2 ]; then
        return
    fi
    docker_command=${tokens[2]}
    case "$docker_command" in
        exec|attach|kill|pause|unpause|port|stats|stop|top|wait)
            _fzf_complete_docker_container_running "$@"
            return
        ;;
        start)
            _fzf_complete_docker_container_stopped "$@"
            return
        ;;
        commit|cp|diff|export|logs|rename|restart|rm|update)
            _fzf_complete_docker_container "$@"
            return
        ;;
        run|save|push|pull|tag|rmi|history|inspect|create)
            _fzf_complete_docker_image "$@"
            return
        ;;
        container)
            if [ ${#tokens} -le 3 ]; then
                return
            fi
            docker_command=${tokens[3]}
            case "$docker_command" in
                exec|attach|kill|pause|unpause|port|stats|stop|top|wait)
                    _fzf_complete_docker_container_running "$@"
                    return
                ;;
                start)
                    _fzf_complete_docker_container_stopped "$@"
                    return
                ;;
                commit|cp|diff|export|inspect|logs|rename|restart|rm|update)
                    _fzf_complete_docker_container "$@"
                    return
                ;;
                run|create)
                    _fzf_complete_docker_image "$@"
                    return
                ;;
            esac
        ;;
        image)
            if [ ${#tokens} -le 3 ]; then
                return
            fi
            docker_command=${tokens[3]}
            case "$docker_command" in
                save|push|pull|tag|rm|history|inspect)
                    _fzf_complete_docker_image "$@"
                    return
                ;;
            esac
        ;;
    esac
}
